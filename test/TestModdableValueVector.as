package {
    import fovea.modding.ModdableValueVector;
    import fovea.modding.ModdableValue;
    import fovea.modding.ModdableValueId;
    public class TestModdableValueVector {
        public static function run():void {

            assert.test("ModdableValueVector.ModdableValueVector()");
            var mv:ModdableValueVector = new ModdableValueVector();
            assert.ok("Is built", mv);
            /*
            var m1id:ModdableValueId = new ModdableValueId("id1");
            var m1:ModdableValue = new ModdableValue(m1id, "lt", "ld", { x:1, y:2 });
            assert.equals("Initializes `id` from first argument",
                "id1", m1.id.value);
            assert.equals("Initializes `localizableTitle` from second argument",
                "lt", m1.localizableTitle);
            assert.equals("Initializes `localizableDescription` from third argument",
                "ld", m1.localizableDescription);
            assert.equals("Initializes `value` from last argument",
                1, m1.value.x);
            assert.equals("Initializes `value` from last argument",
                2, m1.value.y);
                */
        }
    }
}
// vim: ts=4:sw=4:et:

