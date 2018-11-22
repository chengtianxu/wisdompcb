unit putoutinvt_inspect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, Menus, ComCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SGrid1: TStringGrid;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    SGrid2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure update_grid1();
  private
    { Private declarations }
    warehouse_ptr:integer;
  public
    { Public declarations }
    procedure init;
  end;

var
  Form4: TForm4;

implementation

uses damo, main, warehouse_search, stockinvt_search,common;

{$R *.dfm}

procedure tform4.init;
begin
  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='select rkey,warehouse_code,warehouse_name,abbr_name from data0015';
  DM.ADOQuery1.Open;
  if DM.ADOQuery1.RecordCount=1 then
  begin
    edit3.text:=DM.ADOQuery1.FieldValues['warehouse_code'];
    label6.Caption:= DM.ADOQuery1.FieldValues['abbr_name'];
    Edit3.Tag:=dm.ADOQuery1.fieldbyname('rkey').AsInteger;
    self.warehouse_ptr:=DM.ADOQuery1.fieldbyname('rkey').AsInteger;
  end;
end;

procedure tform4.update_grid1();
var
 i:integer;
begin
  edit3.Text:='';
  label6.Caption:='';
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
   sgrid1.RowCount:=2;
   sgrid2.RowCount:=2;
   edit3.Enabled:=true;
   bitbtn3.Enabled:=true;
   edit3.SetFocus;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
try
form_wh:=tform_wh.Create(application);
form_wh.Edit1.Text:=edit3.Text;
if form_wh.ShowModal=mrok then
 begin
  edit3.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
  label6.Caption:=form_wh.ADOQuery1ABBR_NAME.Value;
  self.warehouse_ptr:=form_wh.ADOQuery1RKEY.Value;
 end;
finally
form_wh.Free;
end;
end;

procedure TForm4.Edit3Exit(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015'+#13+
           'where WAREHOUSE_CODE='''+trim(edit3.Text)+'''';
  open;
 if IsEmpty then
  begin
   messagedlg('工厂编码输入错误!!',mterror,[mbcancel],0);
   edit3.SetFocus;
  end
 else
  if FieldValues['rkey']<>self.warehouse_ptr then
  begin
   label6.Caption:=FieldValues['ABBR_NAME'];
   self.warehouse_ptr:=FieldValues['rkey'];
  end;
 end;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='物料编码';
  sgrid1.Cells[1,0]:='物料名称';
  sgrid1.Cells[2,0]:='物料规格';
  sgrid1.Cells[3,0]:='环保标识';
  sgrid1.Cells[4,0]:='发放单位';
  sgrid1.Cells[5,0]:='发放数量';

  sgrid2.Cells[0,0]:='22.rkey';
  sgrid2.Cells[1,0]:='17.rkey';
  Form_stocksearch:=TForm_stocksearch.Create(application);

end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
Form_stocksearch.Free;
end;

procedure TForm4.BitBtn6Click(Sender: TObject);
begin
  if edit3.Text='' then
    messagedlg('请首先输入发料工厂信息!',mterror,[mbcancel],0)
  else
  begin
    if bitbtn3.Enabled then
    begin
      Form_stocksearch.aq22.Close;
      Form_stocksearch.aq22.Open
    end;

 Form_stocksearch.ComboBox1.ItemIndex:=
 Form_stocksearch.ComboBox1.Items.IndexOf(label6.Caption);
 Form_stocksearch.Edit1.Text := edit6.Text;
 if edit6.Text='' then Form_stocksearch.Edit1Change(nil);

    Form_stocksearch.parent_flag:=1;
    Form_stocksearch.ShowModal;
    if sgrid1.RowCount>2 then
    begin
      edit3.Enabled:=false;
      bitbtn3.Enabled:=false;
    end;
  end;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

procedure TForm4.N1Click(Sender: TObject);
var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i]:=sgrid1.Rows[i+1];
   sgrid2.Rows[i]:=sgrid2.Rows[i+1];
  end;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 sgrid2.RowCount:=sgrid2.RowCount-1;
 if sgrid1.RowCount<=2 then
 begin
  edit3.Enabled:=true;
  bitbtn3.Enabled:=true;
 end;
end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
if sgrid1.RowCount>2 then
if messagedlg('你确定不保存此次发料就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 close
else
 sgrid1.SetFocus
else
 close;
end;

procedure TForm4.BitBtn2Enter(Sender: TObject);
begin
  if sgrid1.RowCount<=2 then
  begin
    messagedlg('没有发放的物料不能保存!!',mterror,[mbcancel],0);
    bitbtn6.SetFocus;
    exit;
  end;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
 number:string;
 i:word;
begin
  if dm.find_phycount(number) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:'+number,
    mtinformation,[mbcancel],0);
    exit;
  end;

  dm.ADOConnection1.BeginTrans;
  try
    dm.ado95.close;
    dm.ado95.Open;
    for i:=1 to sgrid1.RowCount-2 do
    begin
      dm.ado95.AppendRecord([6,  //类型
                              strtoint(sgrid2.Cells[1,i]),     //17.rkey
                              strtoint(sgrid2.Cells[0,i]),   // 22.rkey
                              strtoint(user_ptr),  //人员
                              common.getsystem_date(dm.ADOQuery1,0),    //日期 长格式
                              strtocurr(sgrid1.Cells[5,i])]); //数量                             //部门
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='select data0022.QUAN_ON_HAND,data0022.QUAN_IN_INSP,'+#13+
                  'data0022.QUAN_TO_BE_STOCKED,'+#13+
                  'data0017.QUAN_ON_HAND as hand17 from data0022 inner join'+#13+
                  'data0017 on data0022.INVENTORY_PTR=data0017.rkey'+#13+
                  'where data0022.rkey='+sgrid2.Cells[0,i];
        open;
        edit;
        fieldvalues['QUAN_ON_HAND']:= fieldvalues['QUAN_ON_HAND']-dm.ado95QUANTITY.Value; //更新22
        fieldvalues['QUAN_IN_INSP']:= fieldvalues['QUAN_IN_INSP']+dm.ado95QUANTITY.Value; //更新22
        fieldvalues['hand17'] := fieldvalues['hand17']-dm.ado95QUANTITY.Value; //更新17
        post;
        if fieldvalues['QUAN_ON_HAND']-fieldvalues['QUAN_TO_BE_STOCKED'] < 0 then //如果22数量出现负数
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发', mterror,[mbcancel],0);
          self.update_grid1;
          exit;
        end;
      end;
   end;

   dm.ADOConnection1.CommitTrans;
   messagedlg('恭喜!发料成功!', mtinformation,[mbok],0);

   self.update_grid1;
   self.Timer1Timer(sender);
 except
   on E: Exception do
   begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit6.SetFocus;
   end;
 end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text:='发料日期:'+
  formatdatetime('yyyy-mm-dd HH:mm:ss',common.getsystem_date(dm.ADOQuery1,0));
end;

end.
