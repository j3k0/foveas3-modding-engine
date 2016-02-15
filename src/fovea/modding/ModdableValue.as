package fovea.modding {
    public class ModdableValue {
        private var _id:String;
        private var _localizableTitle:String;
        private var _localizableDescription:String;
        private var _value:Object;

        public function get id():String {
            return _id;
        }
        public function get localizableTitle():String {
            return _localizableTitle;
        }
        public function get localizableDescription():String {
            return _localizableDescription;
        }
        public function get value():Object {
            return _value;
        }

        public function ModdableValue(id:String, localizableTitle:String, localizableDescription:String, value:Object) {
            _id = id;
            _localizableTitle = localizableTitle;
            _localizableDescription = localizableDescription;
            _value = value;
        }
    }
}
