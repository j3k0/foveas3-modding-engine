package fovea.modding {
    public class ModdableValueId {
        private var _value:String;
        public function get value():String { return _value; }
        public function ModdableValueId(value:String) {
            this._value = value;
        }

        public function toString():String {
            return "[ModdableValueId '" + value + "']";
        }

        public function equals(x:ModdableValueId):Boolean {
            return x.value === value;
        }
    }
}
// vim: ts=4:sw=4:et:
