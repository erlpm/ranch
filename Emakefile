{
    [
        'src/*'
        , 'src/*/*'
    ],
    [
        {hipe, [o3]}
        %%,encrypt_debug_info
        , debug_info
        , {i, "include"}
        , {outdir, "./../../quant_release/deps/ranch"}
%%        , {parse_transform, lager_transform}
        , {d, disable_auth}
        , {d, enable_gm_cmd}
        , {d, debug}
        , {d, data_debug}
    ]
}.

{
    [
        'test/*'
        , 'test/*/*'
    ],
    [
        {hipe, [o3]}
        %%,encrypt_debug_info
        , debug_info
        , {i, "include"}
        , {outdir, "./../../quant_release/test/deps/ranch"}
%%        , {parse_transform, lager_transform}
        , {d, disable_auth}
        , {d, enable_gm_cmd}
        , {d, debug}
        , {d, data_debug}
    ]
}.