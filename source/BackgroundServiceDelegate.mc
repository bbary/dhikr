using Toybox.Background;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

// The Service Delegate is the main entry point for background processes
// our onTemporalEvent() method will get run each time our periodic event
// is triggered by the system.
//
(:background)
class BackgroundServiceDelegate extends Sys.ServiceDelegate 
{
	function initialize() 
	{
		Sys.ServiceDelegate.initialize();
	}
	
    function onTemporalEvent() 
    {
    	try
    	{
			System.println("onTemporalEvent called");
			//System.println("next execution = "+Background.getTemporalEventRegisteredTime());
			Background.requestApplicationWake("واذكر ربك كثيرا");
			Background.exit(null);
		}
		catch(ex)
		{
			System.println("[onTemporalEvent][TRY_CATCH] error: " + ex.getErrorMessage());
			Background.exit(null);
		}		 
    }

}