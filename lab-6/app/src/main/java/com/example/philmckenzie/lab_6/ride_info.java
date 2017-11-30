package com.example.philmckenzie.lab_6;

/**
 * Created by philmckenzie on 11/29/17.
 */

public class ride_info {
    private String ride;
    private String rideURL;
    private void setCoffeeInfo(Integer ride_type){ switch (ride_type){
        case 0: //gravel
            ride="Roulder Roubaix";
            rideURL="https://coloradobikemaps.com/tag/boulder-roubaix/";
            break;
        case 1: //steep
            ride="the Flagstaff Climb";
            rideURL="https://303cycling.com/flagstaff-hill-climb-boulder-colorado/";
            break;
        case 2: //mountain
            ride="Betasso Loop";
            rideURL="https://303cycling.com/Betasso-From-Eben-G-Fine-Park/";
            break;
        case 3: //terrain
            ride="Valmont Bike Park";
            rideURL="https://bouldercolorado.gov/parks-rec/valmont-bike-park";
            break;
        default:
            ride="none";
            rideURL="https://www.google.com/search?q=boulder+bike+rides&oq=boulder+bike+rides&aqs=chrome..69i57j0l5.3774j0j7&sourceid=chrome&ie=UTF-8";
    }
    }
    public void setRide(Integer ride_type){
        setCoffeeInfo(ride_type);
    }
    public void setRideURL(Integer ride_type){
        setCoffeeInfo(ride_type);
    }
    public String getRide(){
        return ride;
    }
    public String getRideURL(){
        return rideURL;
    }
}
