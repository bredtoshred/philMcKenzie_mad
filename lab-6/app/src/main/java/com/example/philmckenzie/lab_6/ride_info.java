package com.example.philmckenzie.lab_6;

/**
 * Created by philmckenzie on 11/29/17.
 */

public class ride_info {
    private String ride;
    private String rideURL;
    private String rideDescription;
//    private String rideImage;
    private void setRideInfo(Integer ride_type){ switch (ride_type){
        case 0: //gravel
            ride="Roulder Roubaix";
            rideURL="https://coloradobikemaps.com/tag/boulder-roubaix/";
            rideDescription="A Boulder Classic, this is the course for the yearly Boulder Roubaix gravel race.";
            break;
        case 1: //steep
            ride="the Flagstaff Climb";
            rideURL="https://303cycling.com/flagstaff-hill-climb-boulder-colorado/";
            rideDescription="The benchmark for ever Boulder cyclist's climbing ability. The ride is about 5 miles with a 11% average grade";
            break;
        case 2: //mountain
            ride="Betasso Loop";
            rideURL="https://303cycling.com/Betasso-From-Eben-G-Fine-Park/";
            rideDescription="My personal favorite mountain bike ride in Boulder do the loop or take fourmile link for a technical treat";
            break;
        case 3: //terrain
            ride="Valmont Bike Park";
            rideURL="https://bouldercolorado.gov/parks-rec/valmont-bike-park";
            rideDescription="The best way to spen and afternoonon a mountain bike. Valmont bike park offers a variety of feature suitable for a skill levels";
            break;
        default:
            ride="none";
            rideURL="https://www.google.com/search?q=boulder+bike+rides&oq=boulder+bike+rides&aqs=chrome..69i57j0l5.3774j0j7&sourceid=chrome&ie=UTF-8";
            rideDescription="Enjoy your ride.";
    }
    }
    public void setRide(Integer ride_type){
        setRideInfo(ride_type);
    }
    public void setRideURL(Integer ride_type){
        setRideInfo(ride_type);
    }
    public void setRideDescription(Integer ride_type){
        setRideInfo(ride_type);
    }
    public String getRide(){
        return ride;
    }
    public String getRideURL(){
        return rideURL;
    }
    public String getRideDescription(){
        return rideDescription;
    }
}
