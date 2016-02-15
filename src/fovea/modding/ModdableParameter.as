package fovea.modding {
    public class ModdableParameter {
        private var _id:String;
        private var _localizableTitle:String;
        private var _localizableDescription:String;

        public function get id():String {
            return _id;
        }
        public function get localizableTitle():String {
            return _localizableTitle;
        }
        public function get localizableDescription():String {
            return _localizableDescription;
        }

        public function ModdableParameter(id:String, localizableTitle:String, localizableDescription:String) {
            _id = id;
            _localizableTitle = localizableTitle;
            _localizableDescription = localizableDescription;
        }
    }
}
// vim: ts=4:sw=4:et:
