package fovea.modding {

    /**
     A snapshot of the users' favorite Mod.

     <p>It isn't actually more than a thin layer above a IModStorage implementation.</p>

     <p>It also holds the saved/loaded Mod in memory, so that it can be accessed quickly.</p>
     */
    public class DefaultMod implements IModStorage {

        private var _storage:IModStorage;
        private var _mod:Mod;

        /** Constructor.
         *
         * @param storage The storage backend to use.
         */
        public function DefaultMod(storage:IModStorage) {
            _storage = storage;
        }

        /** The Mod to use by default */
        public function get mod():Mod {
            return _mod;
        }

        /** Load the default Mod from storage.
         *
         * @param callback A function(err:Error, mod:Mod):void
         */
        public function load(callback:Function):void {
            _storage.load(function(err:Error, mod:Mod):void {
                if (!err) {
                    _mod = mod;
                }
                callback(err, mod);
            });
        }

        /** Save the default Mod to storage.
         *
         * @param mod The new Mod to use by default.
         * @param callback A function(err:Error):void
         */
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
