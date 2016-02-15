package
{
    import flash.display.Sprite;
    import flash.desktop.NativeApplication;

    public class Main extends Sprite
    {
        public function Main():void
        {
            try {
                TestDefaultMod.run();
                TestMod.run();
                TestModdableParameter.run();
                TestModdableValue.run();
                TestModder.run();
                TestParameterModder.run();
                assert.finish();
                NativeApplication.nativeApplication.exit(0);
            }
            catch(err:Error) {
                trace(err.getStackTrace());
                NativeApplication.nativeApplication.exit(1);
            }

        }
    }
}
// vim: ts=4:sw=4:et:
