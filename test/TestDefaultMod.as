package {
    import fovea.modding.Mod;
    import fovea.modding.ModdableParameterId;
    import fovea.modding.DefaultMod;

    public class TestDefaultMod {
        public static function run():void {

            assert.test("DefaultMod.DefaultMod()");
            var dummyStorage:DummyStorage = new DummyStorage();
            var defaultMod:DefaultMod = new DefaultMod(dummyStorage);
            var failDefaultMod:DefaultMod = new DefaultMod(new FailingStorage());

            var mod:Mod = Mod.fromJSON({
                "param1": "value1",
                "param2": "value2"
            });

            assert.test("DefaultMod.save()");
            defaultMod.save(mod, function(err:Error):void {
                assert.ok("Saves without failures", !err);
            });
            assert.equals("Stores defaults",
                "value1", defaultMod.mod.getValue(new ModdableParameterId("param1")).value);
            assert.equals("Stores defaults",
                "value1", defaultMod.mod.getValue(new ModdableParameterId("param1")).value);
            defaultMod.save(null, function(err:Error):void {
                assert.ok("Fails if mod is null", err);
            });
            failDefaultMod.save(mod, function(err:Error):void {
                assert.ok("Fails if storage fails", err);
            });

            var defaultModAfter:DefaultMod = new DefaultMod(dummyStorage);
            assert.test("DefaultMod.load()");
            failDefaultMod.load(function(err:Error, mod:Mod):void {
                assert.ok("Fails if storage fails", err);
            });

        }
    }
}

import fovea.modding.IModStorage;
import fovea.modding.Mod;

class DummyStorage implements IModStorage {

    var store:Object = {};

    public function load(callback:Function):void {
        callback(null, Mod.fromJSON(store));
    }

    public function save(mod:Mod, callback:Function):void {
        store = mod.toJSON();
        callback(null);
    }
}

class FailingStorage implements IModStorage {

    public function load(callback:Function):void {
        callback(new Error(), null);
    }

    public function save(mod:Mod, callback:Function):void {
        callback(new Error());
    }
}

// vim: ts=4:sw=4:et:
