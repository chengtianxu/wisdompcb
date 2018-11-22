unit adddetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ADODB;

type
  TForm_adddetail = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Edit7: TEdit;
    Edit8: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Lab_rkey17: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    lab_rkey160: TLabel;
    lab_rkey23: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_adddetail: TForm_adddetail;

implementation

uses damo,constvar,pick_item_single,common, detail;

{$R *.dfm}

procedure TForm_adddetail.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;


procedure TForm_adddetail.BitBtn2Click(Sender: TObject);
var inputvar: PDlgInput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  inputvar.Fields:='code/材料编码/100,name/材料名称/200,INV_DESCRIPTION/材料规格/200';
  inputvar.Sqlstr:='select data0017.rkey,inv_part_number as code, '+
  'INV_NAME as name,INV_DESCRIPTION '+
  'from data0017 inner join data0496 '+
  'on data0017.GROUP_PTR=data0496.rkey '+
  'where data0496.SPEC_RKEY is not null '+
  'order by inv_part_number';
  inputvar.KeyField:='code';
  inputvar.InPut_value:=edit1.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['code']);
   edit7.Text:=frmpick_item_single.adsPick.Fieldbyname('name').AsString;
   edit8.Text:=frmpick_item_single.adsPick.Fieldbyname('INV_DESCRIPTION').AsString;
   lab_rkey17.Caption:= frmpick_item_single.adsPick.Fieldbyname('rkey').AsString;
   edit4.SetFocus;
  end
  else edit1.SetFocus;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;
end;

procedure TForm_adddetail.BitBtn3Click(Sender: TObject);
var inputvar: PDlgInput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  inputvar.Fields:='LOCATION_CODE/位置编码/100,LOCATION_NAME/位置名称/200,'+
  'ttype/类型/100,oh_degree/研磨次数/50';
  inputvar.Sqlstr:='select rkey,LOCATION_CODE,type, '+
  'LOCATION_NAME, '+
  'case type when 1 then ''库房'' when 2 then ''待翻磨仓'' when 3 then ''钻机'' '+
  'when 4 then ''供应商'' when 5 then ''报废仓'' end as ttype, oh_degree '+
  'from data0160 where (type=1 or type=2) '+
  'order by rkey';
  inputvar.KeyField:='LOCATION_CODE';
  inputvar.InPut_value:=edit4.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   edit4.Text:=trim(frmpick_item_single.adsPick.FieldValues['LOCATION_CODE']);
   label5.Caption:=frmpick_item_single.adsPick.Fieldbyname('LOCATION_NAME').AsString;
   lab_rkey160.Caption:= frmpick_item_single.adsPick.Fieldbyname('rkey').AsString;
   updown1.Position:= frmpick_item_single.adsPick.Fieldbyname('oh_degree').AsInteger;
   if (frmpick_item_single.adsPick.Fieldbyname('type').AsInteger=1) or
      (frmpick_item_single.adsPick.Fieldbyname('type').AsInteger=2) then
     updown1.Enabled:=false
    else
     updown1.Enabled:=true;
//   edit2.SetFocus;
  end
  else edit4.SetFocus;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;
end;

procedure TForm_adddetail.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_adddetail.BitBtn1Click(Sender: TObject);
var inputvar: PDlgInput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  inputvar.Fields:='CODE/供应商代码/100,SUPPLIER_NAME/名称/300,'+
  'ABBR_NAME/简称/100';
  inputvar.Sqlstr:='select rkey,CODE,SUPPLIER_NAME, ABBR_NAME '+
  'from data0023 '+
  'order by CODE';
  inputvar.KeyField:='CODE';
  inputvar.InPut_value:=edit2.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['CODE']);
   label9.Caption:=frmpick_item_single.adsPick.Fieldbyname('ABBR_NAME').AsString;
   lab_rkey23.Caption:= frmpick_item_single.adsPick.Fieldbyname('rkey').AsString;
   edit3.SetFocus;
  end
//  else edit2.SetFocus;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;
end;

procedure TForm_adddetail.Edit1Exit(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  edit7.Text:='';
  edit8.Text:='';
  Lab_rkey17.Caption:='0';
 end
else
if ActiveControl.Name<>'BitBtn2' then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
  'select data0017.rkey,inv_part_number, '+
  'INV_NAME ,INV_DESCRIPTION '+
  'from data0017 inner join data0496 '+
  'on data0017.GROUP_PTR=data0496.rkey '+
  'where data0496.SPEC_RKEY is not null '+
  'and inv_part_number='+quotedstr(trim(edit1.Text));
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('钻咀代码不正确',1);
    edit1.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>strtoint(Lab_rkey17.Caption) then
    begin
     edit1.Text:=dm.ADOQuery1.Fieldbyname('inv_part_number').AsString;
     Lab_rkey17.Caption:=dm.ADOQuery1.Fieldbyname('rkey').AsString;
     edit7.Text:= dm.ADOQuery1.Fieldbyname('INV_NAME').AsString;
     edit8.Text:= dm.ADOQuery1.Fieldbyname('INV_DESCRIPTION').AsString;
    end;
 end;
end;

procedure TForm_adddetail.Edit4Exit(Sender: TObject);
begin
if trim(edit4.Text)='' then
 begin
  label5.Caption:='';
  lab_rkey160.Caption:='0';
 end
else
if ActiveControl.Name<>'BitBtn3' then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
  'select rkey,LOCATION_CODE,oh_degree, '+
  'LOCATION_NAME from data0160 '+
  'where LOCATION_CODE='+quotedstr(trim(edit4.Text));
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('位置代码不正确',1);
    edit4.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>strtoint(lab_rkey160.Caption) then
    begin
     edit4.Text:=dm.ADOQuery1.Fieldbyname('LOCATION_CODE').AsString;
     lab_rkey160.Caption:=dm.ADOQuery1.Fieldbyname('rkey').AsString;
     label5.Caption:= dm.ADOQuery1.Fieldbyname('LOCATION_NAME').AsString;
     updown1.Position:= dm.ADOQuery1.Fieldbyname('oh_degree').AsInteger;
    end;
 end;
end;

procedure TForm_adddetail.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then
 begin
  label9.Caption:='';
  lab_rkey23.Caption:='0';
 end
else
if ActiveControl.Name<>'BitBtn1' then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
  'select rkey,CODE, '+
  'SUPPLIER_NAME,ABBR_NAME from data0023 '+
  'where CODE='+quotedstr(trim(edit2.Text));
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
    showmsg('供应商代码不正确',1);
//    edit2.SetFocus;
   end
   else
    if dm.ADOQuery1.FieldByName('rkey').AsInteger<>strtoint(lab_rkey23.Caption) then
    begin
     edit2.Text:=dm.ADOQuery1.Fieldbyname('CODE').AsString;
     lab_rkey23.Caption:=dm.ADOQuery1.Fieldbyname('rkey').AsString;
     label9.Caption:= dm.ADOQuery1.Fieldbyname('ABBR_NAME').AsString;
    end;
 end;
end;

procedure TForm_adddetail.Button1Click(Sender: TObject);
var i,iSum:Integer;
begin
if trim(edit1.Text)='' then
 begin
  showmsg('钻咀编码不允许为空!',1);
  edit1.SetFocus;
  exit;
 end;
if trim(edit4.Text)='' then
 begin
  showmessage('位置不允许为空!');
  edit4.SetFocus;
  exit;
 end;
if strtofloat(edit3.Text)<=0 then
 begin
  showmessage('入仓数量必须大于零!');
  edit3.SetFocus;
  exit;
 end;

 with form_detail do
 begin
  strgrid1.Cells[0,strgrid1.RowCount-1] := self.Edit1.Text;
  strgrid1.Cells[1,strgrid1.RowCount-1] := self.edit7.Text;
  strgrid1.Cells[2,strgrid1.RowCount-1] := self.edit8.Text;
  strgrid1.Cells[3,strgrid1.RowCount-1] := self.Label5.Caption;
  strgrid1.Cells[4,strgrid1.RowCount-1] := self.label9.Caption;
  strgrid1.Cells[5,strgrid1.RowCount-1] := self.edit3.Text;
  strgrid1.Cells[6,strgrid1.RowCount-1] := self.edit5.Text;
  strgrid1.Cells[7,strgrid1.RowCount-1] := self.edit6.Text;


  strgrid1.Cells[8,strgrid1.RowCount-1] :=self.Lab_rkey17.Caption;
  strgrid1.Cells[9,strgrid1.RowCount-1] :=self.lab_rkey160.Caption;
  strgrid1.Cells[10,strgrid1.RowCount-1] :=self.lab_rkey23.Caption;

  strgrid1.RowCount:=strgrid1.RowCount+1;

   for i:=1 to StrGrid1.RowCount-2 do
   begin
     iSum:=iSum+StrToInt(StrGrid1.Cells[5,i]);
   end;
   StrGrid1.Cells[4,StrGrid1.RowCount-1]:='合计';
   StrGrid1.Cells[5,StrGrid1.RowCount-1]:=IntToStr(iSum);

 end;


//lab_rkey160.Caption:='0';
lab_rkey23.Caption:='0';
edit2.Text:='';
label9.Caption:='';

Lab_rkey17.Caption:='0';
edit1.Text:='';
edit7.Text:='';
edit8.Text:='';

edit3.Text:='0';
  FormShow(nil);
end;

procedure TForm_adddetail.FormShow(Sender: TObject);
var tmpAdo,InsertAdo:TADOQuery;
    strSQL:string;
begin
  strSQL:=  'select data0017.rkey,inv_part_number, '+
  'INV_NAME ,INV_DESCRIPTION '+
  'from data0017 inner join data0496 '+
  'on data0017.GROUP_PTR=data0496.rkey '+
  'where data0496.SPEC_RKEY is not null and inv_part_number like ''%-0000%''';

  try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=dm.ADOConnection1;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:=strSQL;
//    tmpAdo.Parameters.ParamByName('invNumber').Value:='-0000';
    tmpAdo.Open;
    if not tmpAdo.IsEmpty then
    begin
       edit1.Text:=tmpAdo.Fieldbyname('inv_part_number').AsString;
       Lab_rkey17.Caption:=tmpAdo.Fieldbyname('rkey').AsString;
       edit7.Text:= tmpAdo.Fieldbyname('INV_NAME').AsString;
       edit8.Text:= tmpAdo.Fieldbyname('INV_DESCRIPTION').AsString;
//    end else
//    begin
//      MessageBox(0,'没有设置钻咀专用码，请联系相关部门','操作提示',MB_OK);
//      Exit;
    end;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0023 where code=:sCode');
    tmpAdo.Parameters.ParamByName('sCode').Value:='0';
    tmpAdo.Open;
    if not tmpAdo.IsEmpty then
    begin
      edit2.Text:=tmpAdo.Fieldbyname('CODE').AsString;
      lab_rkey23.Caption:=tmpAdo.Fieldbyname('rkey').AsString;
      label9.Caption:= tmpAdo.Fieldbyname('ABBR_NAME').AsString;
    end else
    begin
      InsertAdo:=TADOQuery.Create(Self);
      InsertAdo.Connection:=dm.ADOConnection1;
      InsertAdo.Close;
      InsertAdo.SQL.Clear;
      InsertAdo.SQL.Add('insert into dbo.data0023 (CODE,SUPPLIER_NAME,ABBR_NAME,CURRENCY_PTR,PAYMENT_TERMS,DISCOUNT,DISCOUNT_DAYS,DISCOUNT2,DISCOUNT2_DAYS) values(''0'',''钻咀研磨专用'',''钻咀研磨专用'',1,0,0,0,0,0)');
//      InsertAdo.SQL.Add('insert into dbo.data0023 (CODE,SUPPLIER_NAME,ABBR_NAME,CURRENCY_PTR) values(''0'',''钻咀研磨专用'',''钻咀研磨专用'',1)');
      InsertAdo.ExecSQL;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0023 where code=:sCode');
      tmpAdo.Parameters.ParamByName('sCode').Value:='0';
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        edit2.Text:=tmpAdo.Fieldbyname('CODE').AsString;
        lab_rkey23.Caption:=tmpAdo.Fieldbyname('rkey').AsString;
        label9.Caption:= tmpAdo.Fieldbyname('ABBR_NAME').AsString;
      end;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
  Edit4.SetFocus;
end;

end.
