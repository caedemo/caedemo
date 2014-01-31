Ext.define("Compass.ErpApp.Desktop.Applications.ExampleApp",{
    extend:"Ext.ux.desktop.Module",
    id:'example_app-win',
    init : function(){
        this.launcher = {
            text: 'Desktop App Demo',
            iconCls:'icon-monitor',
            handler: this.createWindow,
            scope: this
        }
    },

    createWindow : function(){
       var desktop = this.app.getDesktop();
        var win = desktop.getWindow('example_app');
        if(!win){
            win = desktop.createWindow({
                id: 'example_app',
                title:'Desktop App Demo',
                width:1000,
                height:550,
                iconCls: 'icon-monitor',
                shim:false,
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items:[]
            });
        }
        win.show();
    }
});
