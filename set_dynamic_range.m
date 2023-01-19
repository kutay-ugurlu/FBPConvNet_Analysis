function modified_img = set_dynamic_range(img,minimum,maximum)

min_img = min(img,[],"all");
max_img = max(img,[],"all");

modified_img = (img-min_img)*(maximum-minimum)/(max_img-min_img)-maximum;

end