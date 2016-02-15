package fovea.modding {

    public class BaseModder implements IModder {

        private static const GAMEDATA_MOD_KEY:String = "mod";
        private var _children:Vector.<IModder> = new Vector.<IModder>();

        public function load(gameData:Object):Mod {
            return Mod.fromJSON(gameData[GAMEDATA_MOD_KEY]);
        }

        public function save(mod:Mod, gameData:Object):void {
            gameData[GAMEDATA_MOD_KEY] = mod.toJSON();
        }

        public function registerModder(pmodder:IModder):void {
            _children.push(pmodder);
        }

        public function get children():Vector.<IModder> {
            return _children;
        }

        public function apply(mod:Mod, game:*):void {
            for (var j:int = 0; j < _children.length; ++j) {
                _children[j].apply(mod, game);
            }
        }
    }
}
