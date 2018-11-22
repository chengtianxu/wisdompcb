--EP100层压厚度计算
--data0193.bom_flag 
--0铜箔,1PP,2板材覆铜板
procedure TFrmCustPDesign.BitBtn25Click(Sender: TObject);
var i:integer;
  vthick:currency;
  vlastbom_flag,vnextbom_flag:string;
  vlost,vtot_thk:Real;
  
begin
  vthick:=0;
  vlastbom_flag:=Stringgrid8.Cells[20,1];
  vtot_thk:=0;
  if ADO0192.FieldByName('press_thk_flag').AsBoolean then
  begin
    for i:=1 to stringgrid8.RowCount-2 do
    begin
      try
        vlost:=0;
        if Stringgrid8.Cells[20,i]='0' then //铜箔
          if Stringgrid8.Cells[3,i]='100' then
            Stringgrid8.Cells[12,i]:=CurrToStr(StrToCurr(Stringgrid8.Cells[7,i])*StrToCurr(Stringgrid8.Cells[8,i]))
          else
            Stringgrid8.Cells[12,i]:=CurrToStr(StrToCurr(Stringgrid8.Cells[7,i])*StrToCurr(Stringgrid8.Cells[8,i])*6/7)
        else
        if Stringgrid8.Cells[20,i]='1' then //PP
        begin
          if Stringgrid8.Cells[20,i-1]='0' then //上层如果是铜箔，则残铜率导致的流胶一半分给当前PP
            vlost:=vlost+ (100-strtocurr(Stringgrid8.Cells[3,i-1]))/100*StrToCurr(Stringgrid8.Cells[7,i-1])*StrToCurr(Stringgrid8.Cells[8,i-1])/2
          else
          if Stringgrid8.Cells[20,i-1]='2' then //上层如果是板材，则残铜率2铜厚2导致的流胶全部分给当前PP
            vlost:=vlost+ (100-strtocurr(Stringgrid8.Cells[4,i-1]))/100*StrToCurr(Stringgrid8.Cells[11,i-1]);

          if Stringgrid8.Cells[20,i+1]='0' then //下层如果是铜箔，则残铜率导致的流胶一半分给当前PP
            vlost:=vlost+ (100-strtocurr(Stringgrid8.Cells[3,i+1]))/100*StrToCurr(Stringgrid8.Cells[7,i+1])*StrToCurr(Stringgrid8.Cells[8,i+1])/2
          else
          if Stringgrid8.Cells[20,i+1]='2' then //下层如果是板材，则残铜率1铜厚1导致的流胶全部分给当前PP
            vlost:=vlost+ (100-strtocurr(Stringgrid8.Cells[3,i+1]))/100*StrToCurr(Stringgrid8.Cells[10,i+1]);
           Stringgrid8.Cells[12,i]:=currtostr(strtocurr(Stringgrid8.Cells[8,i])-vlost);
        end else
        if Stringgrid8.Cells[20,i]='2' then //覆铜板
        begin
           Stringgrid8.Cells[12,i]:=Stringgrid8.Cells[8,i];
        end;
        vtot_thk:=vtot_thk+strtocurr(Stringgrid8.Cells[12,i]);
      except
      end;
    end;
    edit15.Text:=currtostr(vtot_thk);
  end;

  if not ADO0192.FieldByName('press_thk_flag').AsBoolean then
  begin
    for i:=1 to stringgrid8.RowCount-2 do
    begin
      try
        if strtocurr(Stringgrid8.Cells[1+2,i])>0 then
          vthick:=vthick+(100-strtocurr(Stringgrid8.Cells[1+2,i]))
                  *strtocurr(Stringgrid8.Cells[1+6,i])*strtocurr(Stringgrid8.Cells[1+9,i])/100;
      except
      end;
      try
        if strtocurr(Stringgrid8.Cells[1+3,i])>0 then
          vthick:=vthick+(100-strtocurr(Stringgrid8.Cells[1+3,i]))
                  *strtocurr(Stringgrid8.Cells[1+6,i])*strtocurr(Stringgrid8.Cells[1+10,i])/100;
      except
      end;
    end;
    edit14.Text:=currtostr(vthick);
    try
      edit15.Text:=currtostr(strtocurr(edit5.Text)-strtocurr(edit14.Text));
    except
    end;
  end;
  StringGrid8Exit(sender);
  BitBtn25.Enabled:=false;
这个是计算过程
Edit15是层压厚度
