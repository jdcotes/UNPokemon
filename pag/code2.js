gdjs.GameOverCode = {};


gdjs.GameOverCode.GDcar_9501Objects1= [];
gdjs.GameOverCode.GDNuevoObjetoObjects1= [];
gdjs.GameOverCode.GDNuevoObjeto2Objects1= [];

gdjs.GameOverCode.conditionTrue_0 = {val:false};
gdjs.GameOverCode.condition0IsTrue_0 = {val:false};
gdjs.GameOverCode.condition1IsTrue_0 = {val:false};
gdjs.GameOverCode.condition2IsTrue_0 = {val:false};

gdjs.GameOverCode.func = function(runtimeScene, context) {
context.startNewFrame();
gdjs.GameOverCode.GDcar_9501Objects1.length = 0;
gdjs.GameOverCode.GDNuevoObjetoObjects1.length = 0;
gdjs.GameOverCode.GDNuevoObjeto2Objects1.length = 0;


{

gdjs.GameOverCode.GDNuevoObjeto2Objects1.createFrom(runtimeScene.getObjects("NuevoObjeto2"));

gdjs.GameOverCode.condition0IsTrue_0.val = false;
gdjs.GameOverCode.condition1IsTrue_0.val = false;
{
gdjs.GameOverCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(context.clearEventsObjectsMap().addObjectsToEventsMap("NuevoObjeto2", gdjs.GameOverCode.GDNuevoObjeto2Objects1).getEventsObjectsMap(), runtimeScene, true, false);
}if ( gdjs.GameOverCode.condition0IsTrue_0.val ) {
{
gdjs.GameOverCode.condition1IsTrue_0.val = gdjs.evtTools.input.isMouseButtonReleased(runtimeScene, "Left");
}}
if (gdjs.GameOverCode.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.replaceScene(runtimeScene, "Nivel 1", false);
}}

}

return;
}
gdjs['GameOverCode']= gdjs.GameOverCode;
