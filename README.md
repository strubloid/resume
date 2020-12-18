# Resume
This will contain all the studies that I'd made since 2017 to nowadays



\(count\($analyzed_sql_results\['select_expr'\] == 1 \)

function PMA_isRememberSortingOrder($analyzed_sql_results)
{  
    return $GLOBALS['cfg']['RememberSorting']
        && ! ($analyzed_sql_results['is_count']
            || $analyzed_sql_results['is_export']
            || $analyzed_sql_results['is_func']
            || $analyzed_sql_results['is_analyse'])
        && $analyzed_sql_results['select_from']
        && ((empty($analyzed_sql_results['select_expr']))
            || (count($analyzed_sql_results['select_expr']) == 1)
                && ($analyzed_sql_results['select_expr'][0] == '*'))
        && count($analyzed_sql_results['select_tables']) == 1;
}
