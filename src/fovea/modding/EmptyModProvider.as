package fovea.modding {
    public class EmptyModProvider implements IModProvider {
        public function get mod():Mod { return new Mod(); }
        public function set mod(value:Mod):void {}
    }
}
// vim: ts=4:sw=4:et:
