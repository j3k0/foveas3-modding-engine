package {

    import fovea.modding.Mod;
    import fovea.modding.ModdableParameterId;

    public class TestMod {
        public static function run():void {
            var mod:Mod = Mod.fromJSON({
                "param1": "value1",
                "param2": "value2"
            });

            assert.test("Mod.fromJSON()");
            assert.equals("Links parameters to values",
                "value1", mod.getValue(new ModdableParameterId("param1")).value);

            assert.test("Mod.toJSON()");
            assert.equals("Returns JSON",
                "value1", mod.toJSON().param1);
            assert.equals("Returns JSON",
                "value2", mod.toJSON().param2);

            assert.test("Mod.parameters()");
            assert.equals("Returns the list of parameters",
                "param", mod.parameters[0].value.substr(0,5));
            assert.equals("Returns the list of parameters",
                "param", mod.parameters[1].value.substr(0,5));
        }
    }
}
// vim: ts=4:sw=4:et:
