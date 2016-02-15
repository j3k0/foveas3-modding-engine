package fovea.modding {
    public class ModdableParameterId {
        private var _value:String;
        public function get value():String { return _value; }
        public function ModdableParameterId(value:String) {
            this._value = value;
        }

        public function toString():String {
            return "[ModdableParameterId '" + value + "']";
        }
    }
}
