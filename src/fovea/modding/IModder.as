package fovea.modding {
    /**
     * A Strategy to modify something about a game.
     */
    public interface IModder {
        function apply(mod:Mod, game:*):void;
    }
}
