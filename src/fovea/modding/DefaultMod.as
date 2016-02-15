package fovea.modding {
    public class DefaultMod {

        private var _storage:IModStorage;
        private var _mod:Mod;

        public function get mod():Mod {
            return _mod;
        }

        public function DefaultMod(storage:IModStorage) {
            _storage = storage;
        }

        public function load(callback:Function):void {
            _storage.load(function(err:Error, mod:Mod):void {
                if (!err) {
                    _mod = mod;
                }
                callback(err, mod);
            });
        }

        public function save(mod:Mod, callback:Function):void {
            if (!mod) {
                callback(new Error("Can't save DefaultMod: mod is null"));
                return;
            }
            _mod = mod;
            _storage.save(mod, callback);
        }
    }
}
