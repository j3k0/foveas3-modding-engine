package {
    import fovea.modding.Mod;
    import fovea.modding.BaseModder;
    import fovea.modding.ModdableParameterId;

    public class TestBaseModder {
        public static function run():void {

            var mod:Mod = Mod.fromJSON({
                "param1": "value1",
                "param2": "param2"
            });
            var modder0:BaseModder = new BaseModder();

            assert.test("BaseModder.save()");
            var gameData:Object = {};
            modder0.save(mod, gameData);
            assert.equals("Adds data to the game",
                "value1", gameData.mod.param1);

            assert.test("BaseModder.load()");
            var mod1:Mod = modder0.load(gameData);
            assert.equals("Restores the same mod",
                "value1", mod1.getValue(new ModdableParameterId("param1")).value);

            assert.test("BaseModder.registerModder()");
            var spy:SpyModder = new SpyModder();
            modder0.registerModder(spy);
            assert.equals("Adds the modder as a child",
                spy, modder0.children[0]);
            assert.equals("Doesn't call apply yet",
                0, spy.nCalls);

            assert.test("BaseModder.apply()");
            modder0.apply(mod1, {});
            assert.equals("Calls apply",
                1, spy.nCalls);
        }
    }
}

import fovea.modding.IModder;
import fovea.modding.Mod;

class SpyModder implements IModder {
    public var nCalls:int = 0;
    public function SpyModder() { }
    public function apply(mod:Mod, game:*):void {
        nCalls++;
    }
}

// vim: ts=4:sw=4:et:
