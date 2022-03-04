function noiselevel=varmode(nim,addmul)
        if nargin<2
            addmul=0;
        end
        
       c=im2col(nim,[7 7]);
       s=var(c);
       
       if addmul==0
           m_a=max(s); m_i=min(s);step=(m_a-m_i)/1000;
            a=hist(s,m_i:step:m_a);
           [ma ind]=max(a);
           noiselevel=sqrt(m_i+(ind-1)*step);          
       else
            m=mean(c);m=m.^2;
           cv=s./m;
            m_a=max(cv); m_i=min(cv);step=(m_a-m_i)/1000;
            a=hist(cv,m_i:step:m_a);
           [ma ind]=max(a);
           noiselevel=sqrt(m_i+(ind-1)*step);
       end
      
end