gdjs.InicioCode = {};


gdjs.InicioCode.GDcar_9501Objects1= [];
gdjs.InicioCode.GDNuevoObjetoObjects1= [];
gdjs.InicioCode.GDNuevoObjeto2Objects1= [];
gdjs.InicioCode.GDTexto1Objects1= [];

gdjs.InicioCode.conditionTrue_0 = {val:false};
gdjs.InicioCode.condition0IsTrue_0 = {val:false};
gdjs.InicioCode.condition1IsTrue_0 = {val:false};

gdjs.InicioCode.func = function(runtimeScene, context) {
context.startNewFrame();
gdjs.InicioCode.GDcar_9501Objects1.length = 0;
gdjs.InicioCode.GDNuevoObjetoObjects1.length = 0;
gdjs.InicioCode.GDNuevoObjeto2Objects1.length = 0;
gdjs.InicioCode.GDTexto1Objects1.length = 0;


{


gdjs.InicioCode.condition0IsTrue_0.val = false;
{
gdjs.InicioCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.sceneJustBegins(runtimeScene);
}if (gdjs.InicioCode.condition0IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.resetTimer(runtimeScene, "begin");
}}

}


{


gdjs.InicioCode.condition0IsTrue_0.val = false;
{
gdjs.InicioCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.timerElapsedTime(runtimeScene, 5, "begin");
}if (gdjs.InicioCode.condition0IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.replaceScene(runtimeScene, "Nivel 1", false);
}}

}

return;
}
gdjs['InicioCode']= gdjs.InicioCode;
