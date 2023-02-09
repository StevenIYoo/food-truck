# Architecture

While designing this app and doc there were the following assumptions:
- The CSV file would not have to be updated and not reloaded with new information
- More features are planned in the future so extensibility and flexibility needs to be build in

## `Web API / Phoenix`

### `Controller`
> Module: `FoodTruck.FoodTruckController`

Simple controller to just call the API for the genserver and return a rendered json response from `FoodTruckWeb.FoodTruckView.render/2`

Purposefully didn't write a unit test for the controller as the render functionally was already being tested and it felt like I would be just creating duplicate tests.

### `Renderer`
> Module: `FoodTruck.FoodTruckView`

Responsible to render json. I separated out the render this way so I could refactor this to use the `render_many/3` and `render_one/3`. Would require a slight modification to the current render to just return the map instead of data and a map. So resulting functions would probably look like this:
```elixir
    def render("many.json", %{trucks: trucks}) do
        %{data: render_many(trucks, FoodTruckView, "truck.json")}
    end
    def render("one.json", %{truck: truck}) do
        %{data: render_one(truck, FoodTruckView, "truck.json")}
    end
    def render("truck.json", %{truck: truck}) do
        #Would do mapping here
        %{}
    end
```

## `Food Truck Library`

### `Food Truck GenServer` 
> Module: `FoodTruck.FoodTruckServer`

The GenServer was created to serve as a crude cache.  
This allows the application to only read the CSV file once on `FoodTruck.Application.start/2` and then store it in the GenServer for reuse.

The handle call was designed to be as small as possible and to move any heavy implementations to other modules such as `FoodTruck.FoodTruckStruct`

The drawback to this approach is now there is a bottleneck on the GenServer causing a scaling issue.  
This is due to the fact that GenServer calls are not concurrent so if the food truck list was long enough or there were enough api requests,
the GenServer would not be able to keep up and many of the requests would timeout.

A solution to this would be to remove this specific GenServer and replace it with a true cache ala Redis / Riak.  
You could create a GenServer / Task to read the CSV file then based on the needed functionality,  
run an aggregator to fetch the datasets you would need to cache.  
e.g) Users now want endpoints based on status of food trucks.  
You would read the file then parse it for the different status.  
Then store each status set in a key value cache.  
This would increase the startup time for the service, but it would save you time on having to do a potentially expensive reduce on a large list.

### `Food Truck Supervisor`
> Module: `FoodTruck.FoodTruckSupervisor`

Just a simple supervisor to start up a single instance of the `FoodTruck.FoodTruckServer` GenServer with a `:one_to_one` policy.

One issue currently is if the `FoodTruck.FoodTruckServer` goes down or is not able to be initialized, the supervisor will just keep trying to restart the server for infinity.  This isn't ideal so it would have been better to have a `:restart_try_count` set to 5 and then if it wasn't able to restart in that time, wait for a longer alloted time and attempt to restart again as well as send an email out to whoever would be responsible of fixing it.

### `Food Truck API`
> Module: `FoodTruck.FoodTruckAPI`

A simple wrapper to make the call to the `FoodTruck.FoodTruckServer` for easier use and better refactorability.  
This could have been put into the `FoodTruck.FoodTruckServer` module since it's only a single call, but I prefer just having it in separate files.

### `Food Truck Struct`
> Module: `FoodTruck.FoodTruckStruct`

Contains the type information and struct for `FoodTruck.FoodTruckStruct`. Also contains the implementation for any functionality that would manipulate food trucks or food truck.  
For example, the above mentioned parsing a list based on statuses would be in this module.

## `Shared Functionality`

### `File Reader`
> Module: `FoodTruck.FileReader`

Simple file reader for csv file for parsing.  
Currently the csv is location in the priv directory so it will be built into the _build directory for deployment and locatable in prod.  
Test file is located the in test directory so it won't be built and increase the bundle size.

### `Parse Content`
> Module: `FoodTruck.ParseContent`

Initially tried to read the CSV manually but lost a lot of time and just ended up using the `NimbleCSV` library.

If I had more time, I would like to make the `FoodTruck.ParseContent.parse_content/1` cleaner.  
Right now it's a lot of manually mapping, but I didn't want to spend more time on it since it was already a time sink.

## `Things I Wished I Could Have Worked On`
- Logger and Telemetry is currently lacking. Having a good logging system is essentially to debugging live production systems and Telemetry is the liveblood of performance analysis. These two features are the two things I would work on getting set up next.

- The current unit tests are fragile due to some of the tests going through the GenServer. If update / create / delete functionality was added, there would be potention of having breaking tests due to an unreliable state of the GenServer. This could be mitigated in a couple of ways, but the easiest would probably be to create a mock genserver used for testing.

- I dont' know why I decided to create the functionality of returning a random food truck. Initial test writings took a while due to the issue above and me having to try to get concrete seeds for known states. Time constraints led me to drop test.

- Error handling is lacking in the application. Current using the `!` functions in most places rather than returning tuples and having a control flow that would let me show better error messages