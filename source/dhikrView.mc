import Toybox.Graphics;
import Toybox.WatchUi;

class dhikrView extends WatchUi.View {
    var rand;
    var kalima_height =  250;
    var kalima_width = 250;

    var mikyal_height = 234;
    var mikyal_width = 273;

    var x,y;


    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        //setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        rand = Math.rand()%2;
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        //View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        
        if(rand == 0){
            //x = 20;
            //y = 10;
            x = dc.getWidth()/2 - kalima_width/2;
            y = dc.getHeight()/2 - kalima_height/2;
            dc.drawBitmap(x,y, Application.loadResource(Rez.Drawables.kalima));
        }else{
            //x = 5;
            //y = 20;
            x = dc.getWidth()/2 - mikyal_width/2;
            y = dc.getHeight()/2 - mikyal_height/2;            
            dc.drawBitmap(x,y, Application.loadResource(Rez.Drawables.mohamed));
        }
        
    }
        

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
