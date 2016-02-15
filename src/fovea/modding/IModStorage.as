package fovea.modding {
    /** A mean of storing and loading a Mod */
    public interface IModStorage {

        /** Load a Mod from storage.
         * :: (Err → Mod → Void) → Void
         *
         * @param callback A function(err:Error, mod:Mod):void
         */
        function load(callback:Function):void;

        /** Save a Mod to storage.
         * :: Mod → (Err → Void) → Void
         *
         * @param mod The Mod to save to storage.
         * @param callback A function(err:Error):void
         */
        function save(mod:Mod, callback:Function):void;
    }
}
