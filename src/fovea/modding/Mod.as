package fovea.modding {
    public class Mod {

        private var _json:Object = {};
        private var _valuesForParams:Object = {};
        private var _parameters:Vector.<ModdableParameterId> =
            new Vector.<ModdableParameterId>();

        public function Mod(json:Object) {
            _json = json;
            for (var key:String in json) {
                var value:ModdableValueId = new ModdableValueId(json[key]);
                _valuesForParams[key] = value;
                _parameters.push(new ModdableParameterId(key));
            }
        }

        public function getValue(pid:ModdableParameterId):ModdableValueId {
            return _valuesForParams[pid.value];
        }

        public static function fromJSON(json:Object):Mod {
            return new Mod(json);
        }

        public function toJSON():Object {
            return _json;
        }

        public function get parameters():Vector.<ModdableParameterId> {
            return _parameters;
        }
    }
}
