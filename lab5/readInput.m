function [tot_mat, tot_vec_lbl] = readInputMat(baseDir, is_small)

% Read the necessary mat files
disp('Load existing Body features');
if is_small == 0;
    load([baseDir, 'bdyFeat_fin_bin.mat']);
else
    load([baseDir, 'bdyFeat_fin_small.mat']);
end

% Transform the read datasets so it is able to be analyzed
disp('Transform the read datasets so it is able to be analyzed');
[bdyFeatMat, bdyVectLabel] = transformBdyFeat(bdyVectLabel, ...
                                bdy_is, bdy_js, bdy_vals);  

% Keep the rows that contain at least one feature in it.
keep_row_idcs = find(sum(bdyFeatMat,2));

% tot_mat = bdyFeatMat(keep_row_idcs,:);
tot_mat = bdyFeatMat(keep_row_idcs,:);
tot_vec_lbl = bdyVectLabel(:,1);

% Remove heuristically found unnecessary data.
rmv_col = find(strcmp(tot_vec_lbl, 'nil'));

tot_vec_lbl(rmv_col,:) = [];
tot_mat(:,rmv_col) = [];

end