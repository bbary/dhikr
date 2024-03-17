import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Background;
import Toybox.System;
import Toybox.Time;

(:background)
class dhikr extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        //log("getInitialView -> InitBackgroundEvents");
        InitBackgroundEvents();
        return [ new dhikrView() ] as Array<Views or InputDelegates>;
    }

    function onBackgroundData(d) {
        //log("onBackgroundData d="+d);
        WatchUi.requestUpdate();
    }    

    function getServiceDelegate(){
        //log("getServiceDelegate");
        return [new BackgroundServiceDelegate()];
    }
    
    function InitBackgroundEvents()
    { 	
        
        Background.registerForTemporalEvent(getNextHour());
        /*
        if (Background.getLastTemporalEventTime() != null) {
            try{
    		    //Background.registerForTemporalEvent(nextTime);
                //Background.registerForTemporalEvent(new Time.Duration(60 * 60));

                //System.println("time "+Time.now().value());
                //System.println("time hour "+nexthour);
    		    Background.registerForTemporalEvent(new Time.Moment(nexthour));
            }
            catch (e instanceof Background.InvalidBackgroundTimeException) {
                log("[registerForTemporalEvent] [TRY_CATCH] error: " + e.getErrorMessage());
                log("error1 "+e.mMessage);
                log("error2 "+e.mErrorCode);
                log("error3 "+e.mPcStack);
            }
		} 
		else {
            try{
                //var time = System.getClockTime();
                //var diffToHour = (60-time.min-1)*60+(60-time.sec);
                //var nexthour = Time.now().value().toNumber()+diffToHour;
                //System.println("time "+Time.now().value());
                //System.println("time hour "+nexthour);
    		    Background.registerForTemporalEvent(new Time.Moment(nexthour));
            }
            catch (e instanceof Background.InvalidBackgroundTimeException) {
                log("[now][registerForTemporalEvent] [TRY_CATCH] error: " + e.getErrorMessage());
                log("error1 "+e.mMessage);
                log("error2 "+e.mErrorCode);
                log("error3 "+e.mPcStack);
            }

		}
        */
    }

    function getNextHour(){
        var time = System.getClockTime();
        var diffToHour = (60-time.min-1)*60+(60-time.sec);
        var nexthour = Time.now().value().toNumber()+diffToHour;
        System.println("nexthour called = "+nexthour);
        return new Time.Moment(nexthour);
    }

    function gettime(){
    var myTime = System.getClockTime();
    return myTime.hour.format("%02d") + ":" +
    myTime.min.format("%02d") + ":" +
    myTime.sec.format("%02d");
    
}

function log(msg){
    System.println(gettime()+" - "+msg);
}

}

function getApp() as dhikr {

    return Application.getApp() as dhikr;
}

