package fovea.modding {

    /**
      Define values of customizable parts of a game.

      <p>It's an immutable map <pre>parameterId ⇒ valueId</pre>.</p>

      <p>Can be easily converted from/to JSON, for inclusion in game parameters.</p>
     */
    public class Mod {

        private var _json:Object = {};
        private var _valuesForParams:Object = {};
        private var _parameters:Vector.<ModdableParameterId> =
            new Vector.<ModdableParameterId>();

        /** Constructor.
         *
         * @param json JSON data used to initialize the Mod, in format parameterId ⇒ valueId.
         */
        public function Mod(json:Object = null) {
            _json = json || {};
            for (var key:String in _json) {
                var value:ModdableValueId = new ModdableValueId(_json[key]);
                _valuesForParams[key] = value;
                _parameters.push(new ModdableParameterId(key));
            }
        }

        /** Retrieve the Value for a given Parameter. */
        public function getValue(pid:ModdableParameterId):ModdableValueId {
            return _valuesForParams[pid.value];
        }

        /** Load a Mod from JSON data. */
        public static function fromJSON(json:Object):Mod {
            return new Mod(json);
        }

        /** Convert back a Mod to JSON data. */
        public function toJSON():Object {
            return _json;
        }

        /** Returns the list of Parameters defined in this Mod. */
        public function get parameters():Vector.<ModdableParameterId> {
            return _parameters;
        }

        public function add(pid:ModdableParameterId, vid:ModdableValueId):Mod {
            var json:Object = toJSON();
            json[pid.value] = vid.value;
            return new Mod(json);
        }
    }
}
