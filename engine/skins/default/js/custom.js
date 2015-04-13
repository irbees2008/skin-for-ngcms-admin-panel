function formatSize($file_size){
    if ($file_size >= 1073741824) {
        $file_size = Math.round( $file_size / 1073741824 * 100 ) / 100 + " Ãב";
    } else if ($file_size >= 1048576) {
        $file_size = Math.round( $file_size / 1048576 * 100 ) / 100 + " Ìב";
    } else if ($file_size >= 1024) {
        $file_size = Math.round( $file_size / 1024 * 100 ) / 100 + " Êב";
    } else {
        $file_size = $file_size + " ב";
    }
    return $file_size;
}