package fovea.modding {
    public class ModdableValue {
        private var _id:ModdableValueId;
        private var _localizableTitle:String;
        private var _localizableDescription:String;
        private var _value:Object;

        public function get id():ModdableValueId {
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

        public function ModdableValue(id:ModdableValueId, localizableTitle:String, localizableDescription:String, value:Object) {
            _id = id;
            _localizableTitle = localizableTitle;
            _localizableDescription = localizableDescription;
            _value = value;
        }
    }
}
