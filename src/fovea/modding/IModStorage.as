package fovea.modding {
    public interface IModStorage {

        // `.load:: (Err → Mod → Void) → Void`
        function load(callback:Function):void;

        // `.save:: Mod → (Err → Void) → Void`
        function save(mod:Mod, callback:Function):void;
    }
}
