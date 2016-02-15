package {
    import fovea.modding.ModdableValue;
    public class TestModdableValue {
        public static function run():void {

            assert.test("ModdableValue.ModdableValue()");
            var m1:ModdableValue = new ModdableValue("id1", "lt", "ld", { x:1, y:2 });
            assert.equals("Initializes `id` from first argument",
                "id1", m1.id);
            assert.equals("Initializes `localizableTitle` from second argument",
                "lt", m1.localizableTitle);
            assert.equals("Initializes `localizableDescription` from third argument",
                "ld", m1.localizableDescription);
            assert.equals("Initializes `value` from last argument",
                1, m1.value.x);
            assert.equals("Initializes `value` from last argument",
                2, m1.value.y);
        }
    }
}
// vim: ts=4:sw=4:et:
