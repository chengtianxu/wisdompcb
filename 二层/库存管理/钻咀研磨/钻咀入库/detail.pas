unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, Menus,math,DateUtils;

type
  TForm_detail = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StrGrid1: TStringGrid;
    Label2: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    dtpk1: TDateTimePicker;
    dtpkt1: TDateTimePicker;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure StrGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure update_04(v_seed:string);
    function find_numbererror(number:string):boolean;
    procedure update_data220(rkey219:integer);
  public
    { Public declarations }
    aded_flag:byte;   //1新增2编辑3检查
  end;

var
  Form_detail: TForm_detail;

implementation

uses damo, adddetail,common, DB, ADODB;

{$R *.dfm}
procedure TForm_detail.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Open;
 if dm.ado04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
 end;
end;

procedure TForm_detail.StrGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
//if button=mbright then
// begin
//  strgrid1.MouseToCell(x,y,column,row);
//  if row<>0 then strgrid1.Row:=row;
// end;
end;

procedure TForm_detail.FormActivate(Sender: TObject);
var
// year,month,day:Word;
 i:integer;
begin
 strgrid1.Cells[0,0] := '材料编码';
 strgrid1.Cells[1,0] := '材料名称';
 strgrid1.Cells[2,0] := '材料规格';
 strgrid1.Cells[3,0] := '位置';
 strgrid1.Cells[4,0] := '供应商';
 strgrid1.Cells[5,0] := '数量';
 strgrid1.Cells[6,0] := '研磨次数';
 strgrid1.Cells[7,0] := '备注';
 
 strgrid1.Cells[8,0] := 'rkey17';
 strgrid1.Cells[9,0] := 'rkey160';
 strgrid1.Cells[10,0] := 'rkey23';

 strgrid1.ColWidths[8] :=-1;
 strgrid1.ColWidths[9] :=-1;
 strgrid1.ColWidths[10] :=-1;


if self.aded_flag=1 then  //新增
 begin
  self.dtpk1.Date:=getsystem_date(dm.ADOQuery1,1);
  self.dtpkt1.Time:=
   strtotime(formatdatetime('HH:mm:ss',getsystem_date(dm.ADOQuery1,0)));
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
   edit6.Text:=dm.ado04SEED_VALUE.Value;
  dm.ado04.Close;
 end
else
 begin
  edit6.Text:=dm.ADS219GRN_NUMBER.Value;
  edit5.Text:=dm.ADS219handle_name.Value;
  edit2.Text:=dm.ADS219REMARK.Value;

  self.dtpk1.Date:=
   strtodate(formatdatetime('yyyy-mm-dd',dm.ADS219CREATE_DATE.Value));
  self.dtpkt1.Time:=
  TimeOf(dm.ADS219CREATE_DATE.Value);
  combobox1.ItemIndex:=dm.ADS219TTYPE.Value;
  strgrid1.RowCount:=dm.ADS220.RecordCount+2;
  dm.ADS220.First;
  for i:=1 to dm.ADS220.RecordCount do
  begin
   strgrid1.Cells[0,i] :=dm.ADS220INV_PART_NUMBER.Value; //'材料编码';
   strgrid1.Cells[1,i] :=dm.ADS220INV_NAME.Value;        //'材料名称';
   strgrid1.Cells[2,i] :=dm.ADS220INV_DESCRIPTION.Value; //'材料规格';
   strgrid1.Cells[3,i] :=dm.ADS220LOCATION_NAME.Value; //'位置';
   strgrid1.Cells[4,i] :=dm.ADS220ABBR_NAME.Value;    //'供应商';
   strgrid1.Cells[5,i] :=dm.ADS220QUANTITY.AsString;  //'数量';
   strgrid1.Cells[6,i] :=dm.ADS220OH_degree.AsString; //'研磨次数';
   strgrid1.Cells[7,i] :=dm.ADS220REMARK.Value;       //'备注';

   strgrid1.Cells[8,i] :=dm.ADS220INVENTORY_PTR.AsString; //'rkey17';
   strgrid1.Cells[9,i] :=dm.ADS220LOCATION_PTR.AsString;  //'rkey160';
   strgrid1.Cells[10,i] :=dm.ADS220SUPPLIER_PTR.AsString; //'rkey23';
   dm.ADS220.Next;
  end;
  dm.ADS220.First;

  if dm.ADS219location_fromptr.Value>0 then
  begin
   edit1.Visible:=true;
   label4.Visible:=true;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select LOCATION_NAME from data0160 '+
               'where rkey='+dm.ADS219location_fromptr.AsString;
     open;
    end;
    edit1.Text:=dm.ADOQuery1.fieldbyname('LOCATION_NAME').AsString;
  end;
  if dm.ADS219location_endptr.Value>0 then
  begin
   edit3.Visible:=true;
   label5.Visible:=true;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select LOCATION_NAME from data0160 '+
               'where rkey='+dm.ADS219location_endptr.AsString;
     open;
    end;
    edit3.Text:=dm.ADOQuery1.fieldbyname('LOCATION_NAME').AsString;
  end;

 end;
end;

procedure TForm_detail.PopupMenu1Popup(Sender: TObject);
begin
if strgrid1.Row=strgrid1.RowCount-1 then
 n2.Enabled:=false
else
 n2.Enabled:=true;
end;

procedure TForm_detail.N1Click(Sender: TObject);
begin
 form_adddetail := tform_adddetail.Create(application);

if form_adddetail.ShowModal=mrok then
 begin
 end;
form_adddetail.Free;
end;

procedure TForm_detail.N2Click(Sender: TObject);
var i,iSum:Integer;
 j:integer;
begin
 for j:=strgrid1.Row to strgrid1.RowCount-2 do
  strgrid1.Rows[j].Text:=strgrid1.Rows[j+1].Text;
 strgrid1.RowCount:=strgrid1.RowCount-1;

  iSum:=0;
  for i:=1 to strgrid1.RowCount-2 do
  begin
    iSum:=iSum+StrToInt(strgrid1.Cells[5,i]);
  end;
  strgrid1.Cells[4,strgrid1.RowCount-1]:='合计';
  strgrid1.Cells[5,strgrid1.RowCount-1]:=IntToStr(iSum);

end;

function TForm_detail.find_numbererror(number:string):boolean;

begin
 result := false;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0219');
   sql.Add('where GRN_NUMBER='''+number+'''');
   open;
   if not IsEmpty then  result := true;
  end;

end;

procedure TForm_detail.update_data220(rkey219: integer);
var
 i:integer;
begin
  with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='delete data0220 '+
            'where grn_ptr='+inttostr(rkey219);
    ExecSQL;
   end;

  with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='select grn_ptr,INVENTORY_PTR,SUPPLIER_PTR,LOCATION_PTR,OH_degree, '+
            'QUANTITY,quan_on_hand,REMARK from data0220 where grn_ptr='+ inttostr(rkey219);
    open;
   end;

  for i:=1 to strgrid1.RowCount-2 do
  dm.ADOQuery2.AppendRecord([rkey219,
                             strtoint(strgrid1.Cells[8,i]),
                             strtoint(strgrid1.Cells[10,i]),
                             strtoint(strgrid1.Cells[9,i]),
                             strtoint(strgrid1.Cells[6,i]),
                             strtoint(strgrid1.Cells[5,i]),
                             strtoint(strgrid1.Cells[5,i]),                             
                             strgrid1.Cells[7,i]
                             ]);
end;

procedure TForm_detail.BitBtn1Click(Sender: TObject);
var tmpAdo:TADOQuery;
begin
  if self.aded_flag=1 then //新增
  begin
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=dm.ADOConnection1;
    try
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate>=:DM1 and dEndDate<=:DM2 and iStatus=1');
      tmpAdo.Parameters.ParamByName('DM1').Value:=FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpk1.Date));
      tmpAdo.Parameters.ParamByName('DM2').Value:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(dtpk1.Date));
      tmpAdo.Open;
      if not tmpAdo.Eof then
      begin
        ShowMsg('该月的月末平衡表已审核，不可操作！',1);
        Exit;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;

    if self.find_numbererror(trim(edit6.Text)) then
    begin
     if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
     [mbYes,mbNo],0)=mrYes  then
      begin
      dm.ado04.Close;
      dm.ado04.Open;
      edit6.Text:=dm.ado04SEED_VALUE.Value;
      end
     else
      begin
      edit6.SetFocus;
      exit;
      end;
    end;
    dm.ADOConnection1.BeginTrans;
    try
      with dm.ADOQuery1 do
       begin
        close;
        sql.Text:='select rkey,grn_number,create_date,system_date,ttype,create_by, '+
                'handle_name,remark from data0219 where rkey is null';
        open;
       end;
      dm.ADOQuery1.Append;

      dm.ADOQuery1.FieldByName('GRN_NUMBER').Value:=edit6.Text;
      dm.ADOQuery1.FieldByName('create_date').Value:=
        strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)
                      +formatdatetime('hh:nn:ss',dtpkt1.DateTime));
      dm.ADOQuery1.FieldByName('system_date').Value:=getsystem_date(dm.ADOQuery2,0);
      dm.ADOQuery1.FieldByName('ttype').Value:=combobox1.ItemIndex;
      dm.ADOQuery1.FieldByName('create_by').Value:=user_ptr;
      dm.ADOQuery1.FieldByName('handle_name').Value:=edit5.Text;
      dm.ADOQuery1.FieldByName('remark').Value:=edit2.Text;
      dm.ADOQuery1.Post;

      self.update_04(trim(edit6.Text)); //更新控制码

      self.update_data220(dm.ADOQuery1.Fieldbyname('rkey').AsInteger);

       dm.ADOConnection1.CommitTrans;
       self.ModalResult:=mrok;
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
       edit6.SetFocus;
      end;
    end;
  end
  else  //编辑
  begin
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=dm.ADOConnection1;
    try
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0223 where dBeginDate>=:DM1 and dEndDate<=:DM2 and iStatus=1');
      tmpAdo.Parameters.ParamByName('DM1').Value:=FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpk1.Date));
      tmpAdo.Parameters.ParamByName('DM2').Value:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(dtpk1.Date));
      tmpAdo.Open;
      if not tmpAdo.Eof then
      begin
        ShowMsg('该月的月末平衡表已审核，不可操作！',1);
        Exit;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
    
    if dm.find_qtyerror(dm.ADS219RKEY.Value) then
     showmsg('库存数据发生变化不允许编辑',1)
    else
    try
      dm.ADOConnection1.BeginTrans;
      with dm.ADOQuery1 do
       begin
        close;
        sql.Text:='select rkey,grn_number,create_date,system_date,ttype,create_by, '+
                'handle_name,remark from data0219 where rkey ='+dm.ADS219RKEY.AsString;
        open;
       end;
      dm.ADOQuery1.Edit;
      dm.ADOQuery1.FieldByName('create_date').Value:=
        strtodatetime(formatdatetime('yyyy-mm-dd ',dtpk1.Date)
                      +formatdatetime('hh:nn:ss',dtpkt1.DateTime));
      dm.ADOQuery1.FieldByName('create_by').Value:=user_ptr;
      dm.ADOQuery1.FieldByName('handle_name').Value:=edit5.Text;
      dm.ADOQuery1.FieldByName('remark').Value:=edit2.Text;
      dm.ADOQuery1.Post;

      self.update_data220(dm.ADOQuery1.Fieldbyname('rkey').AsInteger);
       dm.ADOConnection1.CommitTrans;
       self.ModalResult:=mrok;
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
       edit6.SetFocus;
      end;
    end;
  end;
end;

procedure TForm_detail.BitBtn1Enter(Sender: TObject);
begin
if trim(edit6.Text)='' then
 begin
  showmsg('入库单号不允许为空!',1);
  edit6.SetFocus;
  exit;
 end;


if strgrid1.RowCount<=2 then
 begin
  showmsg('入库数据不允许为空!',1);
  strgrid1.SetFocus;
  exit;
 end;

end;


procedure TForm_detail.FormShow(Sender: TObject);
begin
  if (common.rkey73='') then
  begin
    Edit5.Visible:=False;
    Label6.Visible:=False;
    Edit5.Text:='';
  end else
    Edit5.Text:= dm.Get0073(StrToInt(common.rkey73));
end;

end.
