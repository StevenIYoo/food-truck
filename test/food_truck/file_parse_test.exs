defmodule FileParseTest do
  use ExUnit.Case, async: true

  alias FoodTruck.FileReader

  @test_file_local_path "/test/Mobile_Food_Facility_Permit_Test.csv"

  describe "file and content reader" do
    setup do
      {:ok, test_file_local_path: @test_file_local_path}
    end

    test "check csv file read", %{test_file_local_path: test_file} do
      assert FileReader.read_file(test_file) ==
        "locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)\n"
        <> "735318,Ziaurehman Amini,Push Cart,30727000,MARKET ST: DRUMM ST intersection,5 THE EMBARCADERO,0234017,0234,017,15MFF-0159,REQUESTED,,6013916.72,2117244.027,37.794331003246846,-122.39581105302317,http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf,,,,20151231,0,03/15/2016 12:00:00 AM,\"(37.794331003246846, -122.39581105302317)\",4,1,10,28855,6\n"
        <> "1612654,Sunset Mercantile/Outer Sunset Farmers Market & Mercantile,Truck,1835000,37TH AVE: QUINTARA ST to RIVERA ST (2100 - 2199),2155 37TH AVE,2094006,2094,006,22MFF-00031,REQUESTED,Multiple Food Trucks & Food Types,5984527.62,2100736.237,37.74732654654123,-122.49628067270531,http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=22MFF-00031&ExportPDF=1&Filename=22MFF-00031_schedule.pdf,,,,20220421,0,11/15/2022 12:00:00 AM,\"(37.74732654654123, -122.49628067270531)\",1,8,3,29491,35"
    end
  end
end
