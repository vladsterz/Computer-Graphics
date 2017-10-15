%Euresh energwn shmeiwn kai akmwn me xrhsh toy anadromikoy
%algori8mou twn shmeiwsewn.
function [ActAk,ActSm] = findAct(ActAk,ActSm,y,minMax) %%psaxnoume gia y+1

%nees pleures
ne=find(minMax(2,:)==(y));%ymin

%ekseroumenes pleures
eks=find(minMax(4,:)==(y));%ymax

if ~isempty(ActAk)
    ActSm=ActSm + minMax(5,ActAk);%enhmerwsh twn timwn twn oriakwn shmeiwn
end

ActAk=[ActAk ne];%prs8esh energwn akmwn
ActSm=[ActSm minMax(1,ne)];%pros8esh energwn orakwn shmeiwn

if ~isempty(eks)% Afairesh energwn akmwn kai antistoixwn energwn oriakwn shmeiwn
    for j=1:numel(eks)
        temp=find(eks(j)==ActAk);
        ActAk(temp)=[];
        ActSm(temp)=[];
    end
end

[ActSm,ii]=sort(ActSm);% taksinomish twn shmeiwn me vash ta x
ActAk=ActAk(ii);

end