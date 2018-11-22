unit UFDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,ADODB,DB,Pick_Item_Single,
  ConstVar,StrUtils;

type
  TFDetail_Form = class(TForm)
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    SpeedButton14: TSpeedButton;
    SpeedButton13: TSpeedButton;
    btn_3: TButton;
    btn_4: TButton;
    btn_5: TButton;
    btn_6: TButton;
    btn_7: TButton;
    btn_8: TButton;
    btn_9: TButton;
    btn_10: TButton;
    btn_11: TButton;
    btn_12: TButton;
    btn_14: TButton;
    SpeedButton2: TSpeedButton;
    Memo2: TMemo;
    Label6: TLabel;
    Edit_sx: TEdit;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure btn_7Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit_sxExit(Sender: TObject);
    procedure Edit_sxEnter(Sender: TObject);
  private
      A, B: Array of String;  //数组A保存 datafield，数组B保存 itemname
      Index,flag1,lag_tag,flag_sx: Integer;
      strmmo1,stranslated,edit_sx_orginal: string;

    { Private declarations }
  public
    FRkey : string;
    Ftag : Integer;
    { Public declarations }
  end;

var
  FDetail_Form: TFDetail_Form;

implementation

uses UDM,common,MyClass;

{$R *.dfm}

procedure TFDetail_Form.FormShow(Sender: TObject);
var
    QueryTmp:TADOQuery;
    stringtmp1 : string;
begin
     QueryTmp:=TADOQuery.Create(Self);
     QueryTmp.Connection := DM.ADOCon;
     edit_sx_orginal := '0';
     flag_sx :=0 ;
     stringtmp1 := '';
     flag1 := 0;
     if Ftag=0 then
     begin
           self.Caption:='工资项目定义-新增';
           self.Edit2.Text :='';
     with QueryTmp do
           begin
            close;
            sql.Text:=' SELECT     max(itemindex)+1  as itemindex  '+
            '  FROM         dbo.DesignSalaryItem where accountid='+inttostr(dm.F_Accountid);
            open;
            stringtmp1 :=  Trim(FieldByName('itemindex').AsString);
           end; 
           self.Edit_sx.Text :=stringtmp1;
           stringtmp1 := '';
           self.Edit5.Text :='0';
           with QueryTmp do
           begin
                      close;
                      sql.Text:=' select top 1 px from (  '+
                                ' select row_number() over(order by cast( substring(datafield,2,len(datafield)-1) as int)) px,'+
                                ' cast( substring(datafield,2,len(datafield)-1) as int) pxx '+
                                ' from dbo.DesignSalaryItem where  accountid='+inttostr(dm.F_Accountid)+
                                ' )as b '+
                                ' where px=pxx '+
                                ' order by px desc ';
                      open;
                       if QueryTmp.IsEmpty then
                       begin
                         stringtmp1 := '0';
                       end
                       else
                       begin
                         stringtmp1 :=  Trim(FieldByName('px').AsString);
                       end;
                      Close;
           end;
           //delete(stringtmp1,1,1);
           Edit1.Text := 'F'+IntToStr(strtoint(stringtmp1) + 1);
           if   strtoint(stringtmp1) > 80 then
           begin
             ShowMessage('项目限定80个以内');
             Abort;
           end;

     end else
     begin
          if  Ftag in [1,3] then
          begin
                  if Ftag = 1 then
                  begin
                      self.Caption:='工资项目定义-修改';
                      BitBtn2.Enabled := True;
                      RadioGroup1.Enabled := True;
                  end else begin
                      self.Caption:='工资项目定义-查看';
                      BitBtn2.Enabled := False;
                      RadioGroup1.Enabled := False;
                  end;
                  Edit1.Text := DM.ADODesignSalaryItem.FieldByName('datafield').AsString;
                  Edit2.Text := DM.ADODesignSalaryItem.FieldByName('itemname').AsString;
                  RadioGroup1.ItemIndex := DM.ADODesignSalaryItem.FieldByName('datasourcetype').AsInteger;
                  Edit5.Text := DM.ADODesignSalaryItem.FieldByName('fixedmoney').AsString;
                  if DM.ADODesignSalaryItem.FieldByName('Expression1') <> nil then
                  Memo1.Text := DM.ADODesignSalaryItem.FieldByName('Expression1').AsString
                  else Memo1.Text :='';
                  if DM.ADODesignSalaryItem.FieldByName('Expression2') <> nil then
                  Memo2.Text := DM.ADODesignSalaryItem.FieldByName('Expression2').AsString
                  else Memo2.Text:='';

                  Edit_sx.Text := DM.ADODesignSalaryItem.FieldByName('itemindex').AsString;
          end;
     end;
end;

procedure TFDetail_Form.RadioGroup1Click(Sender: TObject);
var
    i: Integer;
begin
       case RadioGroup1.ItemIndex of
           0:
              begin
                    Label4.Visible := True;
                    Edit5.Visible := True;
                    Label4.Caption := '  数值:';
                    Edit5.Enabled := False;
                    Memo1.Enabled := False;
              end;
           2:
              begin
                    Label4.Visible := True;
                    Edit5.Visible := True;
                    Label4.Caption := '固定值:';
                    Edit5.Enabled := True;
                    Memo1.Enabled := False;
              end;
           1:
              begin
                    Label4.Visible := False;
                    Edit5.Visible := False;
                    Memo1.Enabled := True;
              end;
       end;
       for   i   :=   1   to   5   do
       begin
            Tlabel(findcomponent( 'label' + inttostr(i))).Alignment := taRightJustify
       end;

end;

procedure TFDetail_Form.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,chr(VK_delete)]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
  if (key='.') and (Pos('.',(Sender as TEdit).Text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFDetail_Form.BitBtn2Click(Sender: TObject);
var
    QueryTmp:TADOQuery;
    stringtmp1 : string;
begin
      if Trim(Edit2.Text) = '' then
      begin
          ShowMessage('项目名称不能为空，请填写');
          Edit2.SetFocus;
          abort;
      end;
      if RadioGroup1.ItemIndex = -1 then
      begin
          ShowMessage('请先选择数据来源');
          RadioGroup1.SetFocus;
          abort;
      end;
      stringtmp1 := '';
      QueryTmp:=TADOQuery.Create(Self);
      QueryTmp.Connection := DM.ADOCon;
      flag1 := 1;
    Self.SpeedButton14Click(Sender);
      if  Ftag in [1,3] then
      begin
           with QueryTmp do
           begin
                      
                      sql.Text:=' SELECT  getdate() as sys_date, USER_FULL_NAME '+
                                '  FROM         dbo.Data0073  '+
                                '  where rkey =  '+frkey+#13+#13;
                      open;
                      stringtmp1 := '最后修改:'+ FieldByName('sys_date').AsString+' '+FieldByName('USER_FULL_NAME').AsString+' ';
                      close;
           end;
      end;   
      if DM.ADOCon.Connected then
      begin
        if flag_sx = 1 then
        begin
          dm.tmp1.SQL.Clear;
          dm.tmp1.SQL.Text :=' select rkey,itemindex,'+Trim(edit_sx.Text)+' +(select '+
          ' count(*) from dbo.DesignSalaryItem where accountid='+inttostr(dm.F_Accountid)+
          '  and itemindex<= a.itemindex and itemindex>='+Trim(edit_sx.Text)+
          ' and rkey<>'+DM.ADODesignSalaryItem.FieldByName('rkey').asstring+
          '  )as index_S into #temptemp from dbo.DesignSalaryItem a '+
          ' where accountid='+inttostr(dm.F_Accountid)+
          '  and itemindex>='+Trim(edit_sx.Text)+
          ' and rkey<>'+DM.ADODesignSalaryItem.FieldByName('rkey').asstring+
          ' order by a.itemindex  '+
          ' update DesignSalaryItem set itemindex=b.index_s '+
          ' from DesignSalaryItem a   join #temptemp b  on a.rkey=b.rkey  '+
          ' where a.rkey in  (select rkey from #temptemp) and a.rkey <>'+
           DM.ADODesignSalaryItem.FieldByName('rkey').asstring+
          ' drop  table #temptemp  ';
          dm.tmp1.ExecSQL;
          dm.tmp1.SQL.Clear;
        end;
           if Ftag=0 then DM.ADODesignSalaryItem.Append else DM.ADODesignSalaryItem.Edit;
            try
              DM.ADODesignSalaryItem.FieldByName('fixedmoney').AsFloat := StrToFloat(formatfloat('0.00',StrToFloat(Trim(Edit5.Text))));
               if RadioGroup1.ItemIndex = 1 then
                begin
                  DM.ADODesignSalaryItem.FieldByName('Expression1').Value  := Memo1.Text;
                  DM.ADODesignSalaryItem.FieldByName('Expression2').Value  := Memo2.Text;
                  DM.ADODesignSalaryItem.FieldByName('fixedmoney').AsFloat := 0.00;
                end;
              DM.ADODesignSalaryItem.FieldByName('datafield').Value :=  Trim(Edit1.Text);
              DM.ADODesignSalaryItem.FieldByName('itemname').Value :=  Trim(Edit2.Text);
              DM.ADODesignSalaryItem.FieldByName('datasourcetype').Value  := RadioGroup1.ItemIndex;
              DM.ADODesignSalaryItem.FieldByName('IsDisplay').Value  := 1;
              DM.ADODesignSalaryItem.FieldByName('Accountid').Value  := dm.F_Accountid;
              DM.ADODesignSalaryItem.FieldByName('IsAvail').Value  := 1;
              DM.ADODesignSalaryItem.FieldByName('RefreshFlag').Value  := 0;
              DM.ADODesignSalaryItem.FieldByName('ItemIndex').Value  := strtoint(Trim(edit_sx.Text));
              DM.ADODesignSalaryItem.FieldByName('tag').Value  := lag_tag + 1;
              DM.ADOCon.BeginTrans;
              DM.ADODesignSalaryItem.Post;
              DM.ADODesignSalaryItem.UpdateBatch(arAll);
              DM.ADOCon.CommitTrans;
              Frkeymsg2:=DM.ADODesignSalaryItem.FieldByName('rkey').asinteger;
              modalresult:=mrok;
            except
              DM.ADOCon.RollbackTrans;
              showmessage('保存数据失败...');
            end;
      end;

end;

procedure TFDetail_Form.SpeedButton13Click(Sender: TObject);
begin
    Memo1.clear;
    Memo2.clear;
end;

procedure TFDetail_Form.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  i,j:integer;
  sp1,sp2,symbol_txt:string;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'itemname/薪资名称/150,datafield/薪资编号/200,';
    InputVar.Sqlstr := 'select itemname, datafield from DesignSalaryItem where accountid='+inttostr(dm.F_Accountid);
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      symbol_txt := '[' + frmPick_Item_Single.adsPick.FieldValues['itemname'] + ']';
      sp1:=' ';
      sp2:=' ';
      i:=Memo1.SelStart ;
      j:=Memo1.CaretPos.y;
      if copy(Memo1.Text,i,1)=' ' then sp1:='';
      if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
      memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
      Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
      Memo1.SelLength:=3;
      Memo1.SetFocus ;
      strmmo1 := Memo1.Text;
    end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TFDetail_Form.Edit_sxEnter(Sender: TObject);
begin
  //无改动，原值不变
  if   flag_sx = 0  then
  edit_sx_orginal := edit_sx.Text;
end;


procedure TFDetail_Form.Edit_sxExit(Sender: TObject);
begin
  if edit_sx.Text = ''     then   edit_sx.Text := '0';
  if edit_sx.Text <>edit_sx_orginal then
  begin
    dm.tmp1.SQL.Text := 'select * from dbo.DesignSalaryItem '+
      ' where itemindex<>0 and accountid='+inttostr(dm.F_Accountid)+
      ' and itemindex='+edit_sx.Text;
    dm.tmp1.Open;
    if not dm.tmp1.IsEmpty then
     begin
           if Messagedlg('已经有这个序号,保存后原序号顺延更新吗?',
               mtWarning,[mbYES,mbNO],0)=6 then
              begin
                flag_sx :=1 ; 
                dm.tmp1.Close;
                dm.tmp1.SQL.Clear;
              end
              else
              begin
                edit_sx.Text:= edit_sx_orginal  ;
                flag_sx := 0;
                edit_sx.SetFocus;
                dm.tmp1.close;
                dm.tmp1.SQL.Clear;
                abort;
              end;
        end
     else
       begin
        flag_sx := 2 ;
        dm.tmp1.Close;
        dm.tmp1.SQL.Clear;
       end;
  end;

end;

procedure TFDetail_Form.SpeedButton14Click(Sender: TObject);
var
  i, j,ii,jj, tag , q, p, IndexA, IndexB, z  : Integer;
  TmpAStr1, TmpAStr2: Array of Integer;
  StrClean: Array of String;
  str,sourcestr,repleacestr,sp1,sp2,symbol_txt,tmp : string;
  QueryTmp:TADOQuery;
  InputVar: PDlgInput ;
begin
       stranslated := '';
       QueryTmp:=TADOQuery.Create(Self);
       QueryTmp.Connection := DM.ADOCon;
       IndexA := 0;
       IndexB := 0;
       lag_tag := 0;
       str := Memo1.Text;
       i := 0;
       j := 0;
       tag := 0;
       p := 0;
       StrClean := 0;

      if (Length(str) - Length(StringReplace(str, '(', '', [rfReplaceAll]))) <> (Length(str) - Length(StringReplace(str, ')', '', [rfReplaceAll]))) then
      if (Length(str) - Length(StringReplace(str, '(', '', [rfReplaceAll]))) > (Length(str) - Length(StringReplace(str, ')', '', [rfReplaceAll]))) then
      begin
          ShowMessage('公式中有括号不完整,相应的地方缺少")",请修改');
          Memo1.setfocus;
          Abort;
      end else begin
          ShowMessage('公式中有括号不完整,相应的地方缺少"(",请修改');
          Memo1.setfocus;
          Abort;
      end;
      if (Length(str) - Length(StringReplace(str, '[', '', [rfReplaceAll]))) <> (Length(str) - Length(StringReplace(str, ']', '', [rfReplaceAll]))) then
      if (Length(str) - Length(StringReplace(str, '[', '', [rfReplaceAll]))) > (Length(str) - Length(StringReplace(str, ']', '', [rfReplaceAll]))) then
      begin
          ShowMessage('公式中有括号不完整,相应的地方缺少"]",请修改');
          Memo1.setfocus;
          Abort;
      end else begin
          ShowMessage('公式中有括号不完整,相应的地方缺少"[",请修改');
          Memo1.setfocus;
          Abort;
      end;
      if (Length(str) - Length(StringReplace(str, '{', '', [rfReplaceAll]))) <> (Length(str) - Length(StringReplace(str, '}', '', [rfReplaceAll]))) then
      if (Length(str) - Length(StringReplace(str, '{', '', [rfReplaceAll]))) > (Length(str) - Length(StringReplace(str, '}', '', [rfReplaceAll]))) then
      begin
          ShowMessage('公式中有括号不完整,相应的地方缺少"{",请修改');
          Memo1.setfocus;
          Abort;
      end else begin
          ShowMessage('公式中有括号不完整,相应的地方缺少"}",请修改');
          Memo1.setfocus;
          Abort;
      end;
      if Pos('IF', strmmo1) > 0 then
        begin
          tag := 1;
          stranslated := StrUtils.AnsiReplaceText(strmmo1,'IF','   case when    ');
          strmmo1:= stranslated; 
          while i < Length(strmmo1) - 1 do
          begin
                if strmmo1[i] = ',' then
                begin
                    j := j + 1;
                    if j mod 2 <> 0 then
                    begin
                      strmmo1 := Copy(strmmo1,1,i-1) + ' then ' + Copy(strmmo1,i+1,Length(strmmo1)-i);
                    end;
                    if j mod 2 = 0 then
                    begin
                      strmmo1 := Copy(strmmo1,1,i-1) + ' else ' + Copy(strmmo1,i+1,Length(strmmo1)-i);
                    end;
                end;
            inc(i);
          end;
        end;
        if tag = 1 then
        begin
          stranslated := strmmo1 + ' end ';
          strmmo1 := stranslated;
        end;
       i := 0;
       j := 0;
       z := 0;

       if str<>'' then
       begin
          while p <= length(str) do
            begin
              if str[p] = '[' then
              begin
                z := z + 1;
              end;
              inc(p);
            end;
       end;
      setLength(TmpAStr1, z);
      setLength(TmpAStr2, z);
      setLength(StrClean, z);

  if str<>'' then
       begin
        while i <= length(str) do
          begin
            if str[i] = '[' then
            begin
              TmpAStr1[IndexA] := i;
              inc(IndexA);
            end;
            inc(i);
        end;
       end;

      if str<>'' then
       begin
        while j <= length(str)  do
          begin
            if str[j] = ']' then
            begin
              TmpAStr2[IndexB] := j;
              inc(IndexB);
            end;
            inc(j);
          end;
       end;

       for q := 0 to z - 1 do
       begin
            StrClean[q] := copy(Memo1.Text, TmpAStr1[q] + 1, TmpAStr2[q]-TmpAStr1[q] - 1);
       end;
  //此处以前是好的。
  for j := 0  to z - 1 do
  begin
    if Trim(StrClean[j]) = '' then
      begin
        ShowMessage('[]中无内容,请检查公式。');
        Memo1.setfocus;
        Abort;
      end
      else
      begin
        with QueryTmp do
          begin
            close;
            sql.Text:= '';
            sql.Text:=' SELECT   itemname '+
              ' FROM  dbo.DesignSalaryItem '+
              ' where  accountid='+inttostr(dm.F_Accountid)+
              ' and itemname =  '''+Trim(StrClean[j])+''''#13+#13;
            open;
            if IsEmpty then
              begin
                if MessageBox(Handle,'输入的项目名称有误，是否使用智能修复功能?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then
                  begin
                    showmessage('您选择了人工修复语句，请检查公式语句，否则此公式将无法通过验证。');
                    exit;
                  end;
              end;
            close;
            sql.Text:= '';
            sql.Text:=' SELECT   itemname'+
            ' FROM  dbo.DesignSalaryItem '+
            ' where accountid='+inttostr(dm.F_Accountid)+
            ' and itemname like  ''%'+Trim(StrClean[j])+'%'''#13+#13;
            open;
              if RecordCount = 0 then
                begin
                  showmessage('根据不完整的项目名称无法找出匹配的项目名称，请手动修改。');
                  exit;
                end
                else
              if RecordCount = 1 then
                begin
                  sourcestr := Trim(StrClean[j]);
                  repleacestr := FieldByName('itemname').AsString;
                  strmmo1 := Memo1.Text;
                  Memo1.Text := StrUtils.AnsiReplaceText(strmmo1,sourcestr,repleacestr);
                end
                else
              if RecordCount > 1 then
                begin
                  if MessageBox(Handle,'根据不完整的项目名称找出多个匹配的项目名称，是否选择替换？','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then  Exit;
                    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
                    try
                      InputVar.Fields := 'itemname/薪资名称/150,datafield/薪资编号/200,';
                      InputVar.Sqlstr :=  ' SELECT   itemname,datafield'+
                        ' FROM  dbo.DesignSalaryItem '+
                        ' where  accountid='+inttostr(dm.F_Accountid)+
                        ' and itemname like  ''%'+Trim(StrClean[j])+'%'''#13+#13;
                      InputVar.AdoConn := DM.ADOCon;
                      frmPick_Item_Single.InitForm_New(InputVar) ;
                      if frmPick_Item_Single.ShowModal=mrok then
                        begin
                          Memo1.Text := StrUtils.AnsiReplaceText(strmmo1,sourcestr,repleacestr);
                          symbol_txt := frmPick_Item_Single.adsPick.FieldValues['itemname'];
                          sp1:='';
                          sp2:='';
                          ii:=Memo1.SelStart ;
                          jj:=Memo1.CaretPos.y;
                          if copy(Memo1.Text,ii,1)=' ' then sp1:='';
                          if copy(Memo1.Text,ii+1,1)=' ' then sp2:='';
                          memo1.Lines[jj]:=copy(memo1.Lines[jj],1,ii)+sp1+trim(symbol_txt)+sp2+copy(memo1.Lines[jj],ii+1+length(StrClean[j]),length(memo1.Lines[jj])-ii);
                          Memo1.SelStart:=ii+1+length(sp1)+pos('(',trim(symbol_txt));
                          Memo1.SelLength:=3;
                          Memo1.SetFocus ;
                          StrClean[j] := frmPick_Item_Single.adsPick.FieldValues['itemname'];
                        end;
                    finally
                      frmPick_Item_Single.adsPick.Close;
                      frmPick_Item_Single.Free ;
                    end;
                end; 
              end;
            end;
          end;

                
  Setlength(A,z+1);
  Setlength(B,z+1);
  for j := 0  to z - 1 do
    begin
      with QueryTmp do
        begin
          close;
          sql.Text:= '';
          sql.Text:=' SELECT   itemname, datafield,Tag '+
          ' FROM  dbo.DesignSalaryItem '+
          ' where  accountid='+inttostr(dm.F_Accountid)+
          ' and itemname =  '''+Trim(StrClean[j])+''''#13+#13;
          open;
          A[j] :=  FieldByName('datafield').AsString;
          B[j] :=  FieldByName('itemname').AsString;
          if FieldByName('Tag').AsInteger > lag_tag then lag_tag := FieldByName('Tag').AsInteger;
        end;
    end;

  for i := 0 to length(B) - 1 do
  begin
    str := 'ISNULL('+A[i]+',0)' ;
    stranslated := StrUtils.AnsiReplaceText(strmmo1,B[i],str);
    stranslated := StrUtils.AnsiReplaceText(stranslated,'[',' ');
    stranslated := StrUtils.AnsiReplaceText(stranslated,']',' ');
    stranslated := StrUtils.AnsiReplaceText(stranslated,'{',' ');
    stranslated := StrUtils.AnsiReplaceText(stranslated,'}',' ');
    strmmo1:= stranslated;
  end;
  
    Memo2.Text :=  stranslated;
  if RadioGroup1.ItemIndex=1 then
    begin
      try
        with DM.tmp1 do
        begin
          sql.Clear;
          if Pos('exec', stranslated) > 0 then
            SQL.Text := stranslated
          else
            SQL.Text := 'select ' +  stranslated + ' from Employeebasicsalary';
            execSQL;
          if flag1 <> 1 then
            ShowMessage('恭喜你验证通过！');
          end
      except
        showmessage('验证不通过！');
        Abort;
      end;
  end;


end;


procedure TFDetail_Form.btn_7Click(Sender: TObject);
var
sp1,sp2,symbol_txt:string;
i,j:integer;
begin
//Memo1.text := Memo1.text +'IF (     ,         ,     )' ;
symbol_txt:=(Sender as TButton).Caption;
if symbol_txt = 'IF' then
symbol_txt := ' IF(   ,  ,  )';
sp1:=' ';
sp2:=' ';
i:=Memo1.SelStart ;
j:=Memo1.CaretPos.y;
if copy(Memo1.Text,i,1)=' ' then sp1:='';
if copy(Memo1.Text,i+1,1)=' ' then sp2:='';                         //i后面所有值
memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
Memo1.SelLength:=3;
Memo1.SetFocus ;
end;

procedure TFDetail_Form.Memo1Change(Sender: TObject);
begin
strmmo1 := Memo1.Text;
end;

procedure TFDetail_Form.Button1Click(Sender: TObject);
var
i,j : Integer;
L,M: TStringList;
begin
ShowMessage(DM.ADODesignSalaryItem.Parameters[0].value);
end;


end.
