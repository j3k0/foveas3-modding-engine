package fovea.modding {

    /**
     Root instance of a tree of modders.
     
     <ul>
     <li>Maintains a list of children modders that will be applied to the game.</li>
     <li>Save and load mod parameters to/from game's data.</li>
     </ul>

     <p>A BaseModder is meant as a registry of Modder. Each Modder will contain the
     intelligence to apply one (or many) customizations to a game. To do so,
     it pretty much follows the Strategy design pattern.</p>

     <p>This class doesn't define what a "Game" is. It's just some data passed over to
     the children Modders.</p>
     */
    public class BaseModder implements IModder {

        private static const GAMEDATA_MOD_KEY:String = "mod";
        private var _children:Vector.<IModder> = new Vector.<IModder>();

        /** Load Mod from gameData.
         *
         * @param gameData The object to load from.
         *
         * @return a new Mod built from game data, or null in case of error.
         */
        public function load(gameData:Object):Mod {
            if (!gameData[GAMEDATA_MOD_KEY])
                return null;
            return Mod.fromJSON(gameData[GAMEDATA_MOD_KEY]);
        }

        /** Save Mod to gameData.
         *
         * @param mod The mod to save.
         * @param gameData The object to save to.
         */
        public function save(mod:Mod, gameData:Object):void {
            gameData[GAMEDATA_MOD_KEY] = mod.toJSON();
        }

        /** Register a child modder.
         *
         * @param pmodder The child modder to register.
         */
        public function addChild(pmodder:IModder):void {
            _children.push(pmodder);
        }

        /** List of children modders.
         */
        public function get children():Vector.<IModder> {
            return _children;
        }

        /** Apply a Mod to a game.
         *
         * Calls the apply() method on all children modders.
         *
         * @param mod The mod to apply.
         * @param game The game to apply the Mod onto.
         */
        public function apply(mod:Mod, game:*):void {
            for (var j:int = 0; j < _children.length; ++j) {
                _children[j].apply(mod, game);
            }
        }
    }
}
