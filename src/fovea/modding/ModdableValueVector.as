package fovea.modding {
    public class ModdableValueVector {

        private var v:Vector.<ModdableValue> = new Vector.<ModdableValue>;

        public function ModdableValueVector() {
            super();
        }

        public function get length():int {
            return v.length;
        }

        public function get(i:int):ModdableValue {
            return v[i];
        }
        public function set(i:int, value:ModdableValue):void {
            v[i] = value;
        }
        public function push(value:ModdableValue):void {
            v.push(value);
        }

        public function find(vid:ModdableValueId):ModdableValue {
            if (!vid) return null;
            for (var i:int = 0; i < v.length; ++i) {
                if (v[i].id.equals(vid))
                    return v[i];
            }
            return null;
        }

    }
}
