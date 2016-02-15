package {
    import fovea.modding.ModdableParameter;

    public class TestModdableParameter {
        public static function run():void {
            assert.test("ModdableParameter.ModdableParameter()");
            var m1:ModdableParameter = new ModdableParameter("id1", "lt", "ld");
            assert.equals("Initializes `id` from first argument",
                "id1", m1.id);
            assert.equals("Initializes `localizableTitle` from second argument",
                "lt", m1.localizableTitle);
            assert.equals("Initializes `localizableDescription` from third argument",
                "ld", m1.localizableDescription);
        }
    }
}
// vim: ts=4:sw=4:et:
