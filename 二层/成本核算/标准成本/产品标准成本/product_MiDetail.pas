unit product_MIDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, DBCtrls, Mask,
  Grids, DBGrids, Menus, DB, ADODB,math, DBGridEh, DBSumLst;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    ListBox1: TListBox;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBRadioGroup2: TDBRadioGroup;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit21: TDBEdit;
    Label32: TLabel;
    DBEdit22: TDBEdit;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label33: TLabel;
    Panel4: TPanel;
    Edit2: TEdit;
    Label34: TLabel;
    BitBtn4: TBitBtn;
    Panel5: TPanel;
    DBMemo1: TDBMemo;
    SpeedButton3: TSpeedButton;
    CheckBox1: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    DBComboBox1: TDBComboBox;
    Edit3: TEdit;
    Label35: TLabel;
    DBEdit23: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Edit4: TEdit;
    DBEdit24: TDBEdit;
    Label39: TLabel;
    Label40: TLabel;
    Edit5: TEdit;
    DBEdit25: TDBEdit;
    DBGrid2: TDBGrid;
    Label41: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label42: TLabel;
    DBComboBox2: TDBComboBox;
    Label43: TLabel;
    StringGrid1: TStringGrid;
    Panel7: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Edit6: TEdit;
    Label44: TLabel;
    Edit7: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    Edit8: TEdit;
    isopen: TCheckBox;
    DBMemo2: TDBMemo;
    Panel8: TPanel;
    Label47: TLabel;
    BitBtn9: TBitBtn;
    DBMemo3: TDBMemo;
    Panel9: TPanel;
    DBMemo4: TDBMemo;
    Panel10: TPanel;
    Label48: TLabel;
    BitBtn10: TBitBtn;
    Panel11: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit9: TEdit;
    Label49: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    RadioGroup1: TRadioGroup;
    Edit12: TEdit;
    Label52: TLabel;
    Edit13: TEdit;
    Label53: TLabel;
    Edit14: TEdit;
    Label54: TLabel;
    Edit15: TEdit;
    Label55: TLabel;
    Memo1: TMemo;
    Panel12: TPanel;
    Memo2: TMemo;
    Panel13: TPanel;
    Memo3: TMemo;
    Panel14: TPanel;
    Panel15: TPanel;
    DBGrid3: TDBGrid;
    to_part_ptr: TLabel;
    from_part_ptr: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label56: TLabel;
    N4: TMenuItem;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    DBCheckBox4: TDBCheckBox;
    Label57: TLabel;
    Label58: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    rkey25: TLabel;
    status: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label62: TLabel;
    Label63: TLabel;
    BitBtn12: TBitBtn;
    Label64: TLabel;
    BitBtn13: TBitBtn;
    PopupMenu5: TPopupMenu;
    N10: TMenuItem;
    btnBOM: TSpeedButton;
    Panel16: TPanel;
    DBGrid4: TDBGrid;
    Panel17: TPanel;
    DBGridEh1: TDBGridEh;
    Panel18: TPanel;
    DBGridEh2: TDBGridEh;
    Panel19: TPanel;
    DBGridEh3: TDBGridEh;
    Panel20: TPanel;
    GroupBox1: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    edtMatl_1_Basic: TEdit;
    edtMatl_1_scrap: TEdit;
    edtMatl_1_Total: TEdit;
    edtMatl_2_Basic: TEdit;
    edtMatl_2_scrap: TEdit;
    edtMatl_2_Total: TEdit;
    edtOut_Basic: TEdit;
    edtOut_Scrap: TEdit;
    edtOut_Total: TEdit;
    edtBasic_sum: TEdit;
    edtScrap_sum: TEdit;
    edtTotal_Sum: TEdit;
    Panel21: TPanel;
    ComboBox2: TComboBox;
    Label74: TLabel;
    btnApprove: TSpeedButton;
    btnRollback: TSpeedButton;
    Panel22: TPanel;
    DBGridEh4: TDBGridEh;
    Label73: TLabel;
    ComboBox1: TComboBox;
    Label72: TLabel;
    GroupBox2: TGroupBox;
    Label76: TLabel;
    edtP_Basic: TEdit;
    edtP_Scrap: TEdit;
    edtP_Total: TEdit;
    edtP_Out_Total: TEdit;
    edtP_Out_Scrap: TEdit;
    edtP_Out_Basic: TEdit;
    Label77: TLabel;
    Label78: TLabel;
    edtP_Basic_Sum: TEdit;
    edtP_Scrap_Sum: TEdit;
    edtP_Total_Sum: TEdit;
    GroupBox3: TGroupBox;
    Label80: TLabel;
    edtBasic_Total: TEdit;
    edtScrap_Total: TEdit;
    edt_Total_All: TEdit;
    Label75: TLabel;
    edt_self_basic: TEdit;
    edt_Self_Scrap: TEdit;
    edt_Self_Total: TEdit;
    Label79: TLabel;
    edt_Out_Basic: TEdit;
    edt_Out_Scrap: TEdit;
    edt_Out_Total: TEdit;
    Label81: TLabel;
    Label82: TLabel;
    Label85: TLabel;
    labelCostRate: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    Label83: TLabel;
    labelPrice_SQM: TLabel;
    PopupMenu6: TPopupMenu;
    EXCEL1: TMenuItem;
    PopupMenu7: TPopupMenu;
    EXCEL2: TMenuItem;
    PopupMenu8: TPopupMenu;
    EXCEL3: TMenuItem;
    PopupMenu9: TPopupMenu;
    EXCEL4: TMenuItem;
    PopupMenu10: TPopupMenu;
    EXCEL5: TMenuItem;
    BitBtnDriToExcel: TBitBtn;
    Label84: TLabel;
    Label86: TLabel;
    DBText7: TDBText;
    DBText8: TDBText;
    spl1: TSplitter;
    n8: TMenuItem;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit15KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit21KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit21KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure N10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBOMClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure btnApproveClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure EXCEL2Click(Sender: TObject);
    procedure EXCEL3Click(Sender: TObject);
    procedure EXCEL4Click(Sender: TObject);
    procedure EXCEL5Click(Sender: TObject);
    procedure BitBtnDriToExcelClick(Sender: TObject);
    procedure n8Click(Sender: TObject);
    procedure PopupMenu7Popup(Sender: TObject);
  private
    { Private declarations }
   FisRefresh:boolean;
   OldGridWnd : TWndMethod;
   dbgrid2wnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure NewGrid2Wnd (var Message : TMessage);
   procedure get_picturedata502(rkey25:integer);
   procedure get_value(rkey278:integer);


   procedure  get_drill(rkey25:integer);
   function get_employeename(rkey05: integer):string;
   function get_mindrill():single;
   function get_customer(rkey10:integer):string;
   procedure update_notebook();
   procedure get_ecninfo(to_part_ptr:integer);
   function find_spec_rkey(spec_rkey: string): boolean;
   procedure update_tecparameter(rkey25:integer);
   procedure update_drill(rkey25:integer);
   function get_date0025toprkey(rkey25: integer):integer;
   procedure get_treedate(rkey25:integer;treeview:Ttreeview);
   procedure Show_Cost_Summary;//显示成本
   procedure SetButtonState;

  public
  EnterMode:byte;
   procedure get_data0279(rkey25:integer);
    { Public declarations }
  end;

type
 TMyDBGrid=class(TDBGrid);

var
 Form2: TForm2;

implementation

uses Dm, common, MyClass, flowpara_edit, ConstVar, Excel2000;

{$R *.dfm}
function TForm2.find_spec_rkey(spec_rkey: string): boolean;
begin
dmcon.ads279.DisableControls;
result:=false;
dmcon.ads279.First;
while not dmcon.ads279.Eof do
 begin
  if trim(dmcon.ads279SPEC_RKEY.Value)=spec_rkey then
   begin
    result:=true;
    break;
   end;
  dmcon.ads279.Next;
 end;
dmcon.ads279.EnableControls;
end;

procedure TForm2.get_ecninfo(to_part_ptr:integer);
begin
with dmcon.ADOQuery1 do
begin
 close;
 sql.Text:='SELECT dbo.Data0273.ECN_NO, dbo.Data0273.text, dbo.Data0273.remark,'+#13+
      'Data0005_1.EMPLOYEE_NAME AS ent_emplname, dbo.Data0273.ENTERED_DATE,'+#13+
      'data0005_2.EMPLOYEE_NAME AS modi_emplname, dbo.Data0273.last_modi_date,'+#13+
      'data0273.SOURCE, dbo.Data0273.TEXT1, dbo.Data0273.TEXT3,'+#13+
      'data0025_1.MANU_PART_NUMBER AS from_partnumber,'+#13+
      'Data0025_2.MANU_PART_NUMBER AS to_partnumber,'+#13+
      'Data0273.COPYFROMCUST_PTR, dbo.Data0273.CUSTOMER_PART_PTR'+#13+
      'FROM dbo.Data0273 INNER JOIN'+#13+
      'dbo.Data0005 Data0005_1 ON'+#13+
      'dbo.Data0273.ENTERED_BY = Data0005_1.RKEY INNER JOIN'+#13+
      'dbo.Data0025 data0025_1 ON'+#13+
      'dbo.Data0273.COPYFROMCUST_PTR = data0025_1.RKEY INNER JOIN'+#13+
      'dbo.Data0025 Data0025_2 ON'+#13+
      'dbo.Data0273.CUSTOMER_PART_PTR = Data0025_2.RKEY LEFT OUTER JOIN'+#13+
      'dbo.Data0005 data0005_2 ON dbo.Data0273.last_modi_by_ptr = data0005_2.RKEY'+#13+
      'where data0273.CUSTOMER_PART_PTR='+inttostr(to_part_ptr);
 open;
 if not isempty then
 begin
  edit9.Text:=fieldbyname('ECN_NO').AsString;
  edit10.Text:=fieldbyname('from_partnumber').AsString;
  edit11.Text:=fieldbyname('to_partnumber').AsString;
  edit12.Text:=fieldbyname('ent_emplname').AsString;
  edit13.Text:=fieldbyname('ENTERED_DATE').AsString;
  edit14.Text:=fieldbyname('modi_emplname').AsString;
  edit15.Text:=fieldbyname('last_modi_date').AsString;
  radiogroup1.ItemIndex:=fieldbyname('source').AsInteger;
  memo2.Text:=fieldbyname('text').AsString;
  memo1.Text:=fieldbyname('remark').AsString;
  self.to_part_ptr.Caption:=fieldbyname('CUSTOMER_PART_PTR').AsString;
  self.from_part_ptr.Caption:=fieldbyname('COPYFROMCUST_PTR').AsString;
 end
else
 begin
  self.from_part_ptr.Caption:='0';
 end;
end;
end;

procedure TForm2.update_notebook;
begin
 dmcon.AQY0025.Close;
 dmcon.ads502.Close;
 dmcon.ads279.Close;
 dmcon.ADS38.Close;
 dmcon.ads494.Close;
 dmcon.ads89.Close;
 edit3.Text:='';  //最后修改人
 isopen.Checked:=false;  //钻孔表需要重新打开
 memo2.ReadOnly:=false;  //ECN需要重新打开
 memo3.ReadOnly:=false;  //客户信息需要重新打开
end;

procedure  TForm2.get_value(rkey278:integer);
begin
  with dmcon.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select tvalue from data0338 where parameter_ptr='+inttostr(rkey278));
    open;
   end;
  if not dmcon.adoquery1.IsEmpty then
   begin
    DBComboBox1.Items.Clear;
    while not dmcon.adoquery1.eof do
     begin
      DBComboBox1.Items.Add(trim(dmcon.adoquery1.FieldValues['tvalue']));
      dmcon.adoquery1.Next;
     end;
   end
  else
   DBComboBox1.Items.Clear;
end;

procedure TForm2.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm2.NewGrid2Wnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid2.DataSource.DataSet.MoveBy(1)
   else
     DBGrid2.DataSource.DataSet.MoveBy(-1)
 end
 else
   dbgrid2wnd(Message);
end;

procedure TForm2.get_picturedata502(rkey25:integer);
begin
 image1.Picture.Assign(nil);
 image2.Picture.Assign(nil);
 image3.Picture.Assign(nil);
 image1.Canvas.Brush.Color:=clwhite;
 image2.Canvas.Brush.Color:=clwhite;
 image3.Canvas.Brush.Color:=clwhite;
 dmcon.ads502.Close;
 dmcon.ads502.Parameters[0].Value:=rkey25;
 dmcon.ads502.Open;
 if not dmcon.ads502.IsEmpty then
 begin
 
  image1.Picture.Assign(Load_JPG_Pic_From_DB(dmcon.ads502sheet_BMP));

  if dmcon.ads502PNL_LEN.Value>0 then
   image2.Picture.Assign(Load_JPG_Pic_From_DB(dmcon.ads502pnl_bmp));
  if dmcon.ads502PNL_LEN_2.Value>0 then
   image3.Picture.Assign(Load_JPG_Pic_From_DB(dmcon.ads502pnl2_bmp));
 end;
end;


procedure TForm2.get_data0279(rkey25:integer);
begin
  dmcon.ads279.DisableControls;
  dmcon.ads279.close;
  dmcon.ads279.Parameters[0].Value:=rkey25;
  dmcon.ads279.Open;

  with dmcon.ADOQuery1 do
  begin
   close;
   sql.Text:=
   'SELECT TOP 100 PERCENT RKEY,SEQUENCE_NO FROM dbo.Data0278'+#13+
   'WHERE (CATEGORY_PTR = 2)'+#13+
   'ORDER BY SEQUENCE_NO';
   open;
  end;

  if dmcon.ads279.IsEmpty then
   begin
    while not dmcon.ADOQuery1.Eof do
     begin
      dmcon.ads279.Append;
      dmcon.ads279source_PTR.Value := rkey25;
      dmcon.ads279parameter_ptr.Value := dmcon.ADOQuery1.FieldValues['rkey'];
      dmcon.ads279IES_PROD.Value:=1;       //代表全局参数0代表流程判断参数
      dmcon.ads279IES_CRP.AsVariant:=dmcon.ADOQuery1.FieldValues['SEQUENCE_NO'];//排序字段
      dmcon.ads279.Post;
      dmcon.ADOQuery1.Next;
     end;
    dmcon.ADOQuery1.Close;
    dmcon.ads279.First;
   end
  else
   begin
    while not dmcon.ADOQuery1.Eof do
     begin
      if not dmcon.ads279.Locate('parameter_ptr',dmcon.ADOQuery1.FieldValues['rkey'],[]) then
       begin
        dmcon.ads279.Append;
        dmcon.ads279source_PTR.Value:=rkey25;
        dmcon.ads279parameter_ptr.Value:=dmcon.ADOQuery1.FieldValues['rkey'];
        dmcon.ads279IES_PROD.Value:=1;
        dmcon.ads279IES_CRP.AsVariant:=dmcon.ADOQuery1.FieldValues['SEQUENCE_NO'];//排序字段
        dmcon.ads279.Post;
       end;
       dmcon.ADOQuery1.Next;
     end;
    dmcon.ADOQuery1.Close;
    dmcon.ads279.First;
   end;

  dmcon.ads279.EnableControls;
end;

function TForm2.get_mindrill():single;
var
 min_drill:single;
 i:integer;
begin
 try
  min_drill:= strtocurr( stringgrid1.Cells[5,1]);
 except
  min_drill:=0;
 end;

 if stringgrid1.RowCount>3 then
 for i:=2 to stringgrid1.RowCount-2 do
 begin
  try
   strtofloat(stringgrid1.Cells[5,i]);
  except
   Continue;
  end;
  if  strtofloat(stringgrid1.Cells[5,i]) < min_drill then
   min_drill:= strtocurr( stringgrid1.Cells[5,i]);
 end;
 result:=min_drill;
end;

procedure TForm2.update_tecparameter(rkey25:integer);
begin
with dmcon.ADOQuery1 do
begin
 close;
 sql.Text:='delete from data0494 where custpart_ptr='+inttostr(rkey25);
 execsql;
end;

with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT PARAMETER_PTR, PARAMETER_VALUE, custpart_ptr, step_number,'+#13+
  ' seq_no, Doc_Flag, after_flag, flow_spfc_flag'+#13+
  'FROM dbo.Data0494'+#13+
  'where custpart_ptr='+inttostr(rkey25);
  open;
 end;

dmcon.ads494.Filter:='';
dmcon.ads494.First;
while not dmcon.ads494.Eof do
begin
   dmcon.ADOQuery1.AppendRecord([dmcon.ads494PARAMETER_PTR.Value,
                              dmcon.ads494PARAMETER_VALUE.Value,
                              dmcon.ads494custpart_ptr.Value,
                              dmcon.ads494step_number.Value,
                              dmcon.ads494seq_no.Value,
                              dmcon.ads494Doc_Flag.Value,
                              dmcon.ads494after_flag.Value,
                              dmcon.ads494flow_spfc_flag.Value
                              ]);
 dmcon.ads494.Next;
end;


end;

procedure TForm2.update_drill(rkey25:integer);
var
 i:integer;
begin
with dmcon.ADOQuery1 do
begin
 close;
 sql.Text:='delete from data0029 where source_ptr='+inttostr(rkey25);
 execsql;
end;

with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
  'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO'+#13+
  'FROM dbo.Data0029'+#13+
  'where source_ptr='+inttostr(rkey25);
  open;
 end;
  for i:=1 to stringgrid1.RowCount-2 do
   dmcon.ADOQuery1.AppendRecord([rkey25,
                              stringgrid1.Cells[0,i],
                              stringgrid1.Cells[1,i],
                              stringgrid1.Cells[2,i],
                              stringgrid1.Cells[3,i],
                              stringgrid1.Cells[4,i],
                              stringgrid1.Cells[5,i],
                              stringgrid1.Cells[6,i],
                              stringgrid1.Cells[7,i],
                              stringgrid1.Cells[8,i],
                              stringgrid1.Cells[9,i],
                              i]);

{    stringgrid1.Cells[0,i]:=trim(fieldbyname('SEQ_NR').AsString); //'刀具';
    stringgrid1.Cells[1,i]:=trim(fieldbyname('MARK').AsString);//'符号';
    stringgrid1.Cells[2,i]:=trim(fieldbyname('HOLES_DIA').AsString);//'成品孔径';
    stringgrid1.Cells[3,i]:=trim(fieldbyname('PTH').AsString);//'PTH';
    stringgrid1.Cells[4,i]:=trim(fieldbyname('TOLERANCE').AsString);//'公差';
    stringgrid1.Cells[5,i]:=trim(fieldbyname('DRILL_DIA').AsString);//'钻咀';
    stringgrid1.Cells[6,i]:=trim(fieldbyname('UNIT').AsString);//'PCS孔数';
    stringgrid1.Cells[7,i]:=trim(fieldbyname('PANEL_A').AsString);//'A板孔数';
    stringgrid1.Cells[8,i]:=trim(fieldbyname('PANEL_B').AsString);//'B板孔数';
    stringgrid1.Cells[9,i]:=trim(fieldbyname('REMARK').AsString);//'备注';

}

end;

procedure  TForm2.get_drill(rkey25:integer);
var
 i:integer;
begin
for i:=1 to stringgrid1.RowCount-2 do
 stringgrid1.Rows[i].Clear;
with dmcon.ADOQuery1 do
begin
 close;
 sql.Text:=' SELECT DG_ADJ_PTH, DG_ADJ_NPTH FROM Data0008'+#13+
            'where rkey='+dmcon.AQY0025PROD_CODE_PTR.AsString;
 open;
 edit7.Text:=fieldbyname('dg_adj_pth').AsString;
 edit8.Text:=fieldbyname('dg_adj_npth').AsString;
end;

with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
  'UNIT, PANEL_A, PANEL_B, REMARK,SET_UNMBER'+#13+
  'FROM dbo.Data0029'+#13+
  'where source_ptr='+inttostr(rkey25)+#13+
  'ORDER BY SEQ_NO';
  open;
  stringgrid1.RowCount:=RecordCount+2;
  for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i]:=inttostr(i);
    stringgrid1.Cells[1,i]:=trim(fieldbyname('SEQ_NR').AsString); //'刀具';
    stringgrid1.Cells[2,i]:=trim(fieldbyname('MARK').AsString);//'符号';
    stringgrid1.Cells[3,i]:=trim(fieldbyname('HOLES_DIA').AsString);//'成品孔径';
    stringgrid1.Cells[4,i]:=trim(fieldbyname('PTH').AsString);//'PTH';
    stringgrid1.Cells[5,i]:=trim(fieldbyname('TOLERANCE').AsString);//'公差';
    stringgrid1.Cells[6,i]:=trim(fieldbyname('DRILL_DIA').AsString);//'钻咀';
    stringgrid1.Cells[7,i]:=trim(fieldbyname('UNIT').AsString);//'PCS孔数';
    stringgrid1.Cells[8,i]:=trim(fieldbyname('SET_UNMBER').AsString);//'SET孔数';
    stringgrid1.Cells[9,i]:=trim(fieldbyname('PANEL_A').AsString);//'A板孔数';
    stringgrid1.Cells[10,i]:=trim(fieldbyname('PANEL_B').AsString);//'B板孔数';
    stringgrid1.Cells[11,i]:=trim(fieldbyname('REMARK').AsString);//'备注';
    next;
   end;
 end;
edit6.Text:=formatfloat('0.00',(get_mindrill()));
isopen.Checked:=true;
end;

function tform2.get_customer(rkey10:integer):string;
begin
with dmcon.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select memo_text from data0011 where SOURCE_TYPE=6010');
  sql.Add('and FILE_POINTER='+inttostr(rkey10));
  open;
  if not IsEmpty then
   result:=FieldValues['memo_text']
  else
   result:='';
 end;
end;

function TForm2.get_date0025toprkey(rkey25: integer):integer;
var
 rkey:integer;
begin
with dmcon.ADOQuery2 do
 begin
  close;
  sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey25);
  open;
  rkey := fieldbyname('parent_ptr').AsInteger; //等于父值
 end;

 if rkey <= 0 then
  rkey:=rkey25       //如果产是顶层等于自己
 else
  with dmcon.ADOQuery2 do
  begin
   close;
   sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
   open;
   if FieldByName('parent_ptr').AsInteger > 0 then
    rkey := fieldbyname('parent_ptr').AsInteger;  //如果有爷爷等于爷爷值
  end;
 result:=rkey;
end;

procedure TForm2.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
 lqry: TADOQuery;
 ls: TStringList;

  LSql: string;

 LNode: TTreeNode;
 LPRkey25: PInteger1;
 LNodeArr: array of TTreeNode;
 I: Integer;
 n: Integer;
begin
  //for I := 0 to Length(FRkey25Arr) - 1 do FRkey25Arr[I] := -1;
  N := 0;
  LSql := ';WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) ' +
    ' AS (SELECT RKey,0,MANU_PART_NUMBER,PARENT_PTR ' +
    ' FROM Data0025 WHERE RKey = '+ IntToStr(rkey25) +' UNION ALL  ' +
    ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
    ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) SELECT * FROM CTE ORDER BY lv asc';
  dmcon.ADOQuery1.Close;
  dmcon.ADOQuery1.SQL.Text := LSql;
  dmcon.ADOQuery1.Open;
  while not dmcon.ADOQuery1.Eof do
  begin
    if (dmcon.ADOQuery1.FieldByName('PARENT_PTR').AsInteger = 0) or (treeview.Items.Count = 0) then
    begin
      LNode := treeview.Items.AddChild(nil,dmcon.ADOQuery1.FieldByName('MANU_PART_NUMBER').AsString);
    end else
    begin
      for I := 0 to Length(LNodeArr) - 1 do
      begin
        if Pinteger1(LNodeArr[I].Data)^ = dmcon.ADOQuery1.FieldByName('PARENT_PTR').AsInteger then
        begin
          LNode := treeview.Items.AddChild(LNodeArr[I],dmcon.ADOQuery1.FieldByName('MANU_PART_NUMBER').AsString);
          Break;
        end;
      end;
    end;


    //SetLength(FRkey25Arr,Length(FRkey25Arr)+1);
    //N := High(FRkey25arr);
    new(rkey0025);
    rkey0025^ := dmcon.ADOQuery1.FieldByName('rkey').AsInteger;
    LNode.Data := rkey0025;
    //ShowMessage(IntToStr(Pinteger1(LNode.Data)^));

    SetLength(LNodeArr,Length(LNodeArr) + 1);
    LNodeArr[N] := LNode;

    N := N +1;
    dmcon.ADOQuery1.Next;
  end;

  treeview.FullExpand; //全部展开
  treeview.Items[0].Selected:=true;
  Exit;





  lqry := TADOQuery.Create(Self);
  ls := TStringList.Create;
  try
with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  new(rkey0025);
  rkey0025^:=fieldvalues['rkey'];
  node:=treeview.Items.AddObject
  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
  node.ImageIndex:=0;  //为第一层节点定义图画
 end;

with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  while not dmcon.ADOQuery1.Eof do
  begin
   new(rkey0025);
   rkey0025^:= dmcon.ADOQuery1.fieldvalues['rkey'];
   node:=treeview.Items.AddChildObject
      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
   node.ImageIndex := 1;
   with dmcon.ADOQuery2 do
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              dmcon.ADOQuery1.fieldbyname('rkey').AsString;
     open;
     while not dmcon.ADOQuery2.Eof do
     begin
      new(rkey0025);
      rkey0025^:= dmcon.ADOQuery2.fieldvalues['rkey'];
      node:=treeview.Items.AddChildObject
       (node, dmcon.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
      node.ImageIndex := 2;
       with ls do
       begin
         ls.Clear;
         Add('select rkey,MANU_PART_NUMBER from data0025 where parent_ptr=');
         Add(dmcon.ADOQuery2.fieldbyname('rkey').AsString);
         if dmcon.SQLOpen(lqry,ls) then
         begin
           lqry.First;
           while not lqry.Eof do
           begin
             New(rkey0025);
             rkey0025^ := lqry.fieldByName('rkey').AsInteger;
              node:=treeview.Items.AddChildObject
               (node, lqry.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
              node.ImageIndex := 3;
              node := node.Parent;
              lqry.Next;
           end;
         end;
       end;
      node:=node.Parent;
      dmcon.ADOQuery2.Next;
     end;
    end;
   node:=node.Parent; //节点指向其父节点值
   dmcon.ADOQuery1.Next;
  end;
 end;

 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
 finally
   lqry.Close;
   lqry.Free;
   ls.Free;
 end;
end;

function TForm2.get_employeename(rkey05: integer):string;
begin
 with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:='select employee_name from data0005'+#13+
             'where rkey='+inttostr(rkey05);
  open;
  if isempty then
   result:=''
  else
   result:=fieldbyname('employee_name').asstring;
 end;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<4 then dbgrid1.SelectedIndex:=4;
end;

procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (gdFocused in State) then
 begin
  if (column.FieldName = DBComboBox1.DataField ) then
   begin
    DBComboBox1.Left := Rect.Left+1;
    DBComboBox1.Top := Rect.Top+2;
    DBComboBox1.Width := Rect.Right - Rect.Left+3;
    DBComboBox1.Height := Rect.Bottom - Rect.Top;
    self.get_value(dmcon.ads279PARAMETER_PTR.Value);
    if dbcombobox1.Items.Count > 0 then
     DBComboBox1.Visible := True
    else
     DBComboBox1.Visible := false;
   end;
 end;

with TMyDBGrid(Sender) do
 begin
  if DataLink.ActiveRecord=Row-1 then
   begin
    Canvas.Font.Color:=clWhite;
    Canvas.Brush.Color:=$00800040;
   end
  else
   begin
    Canvas.Brush.Color:=Color;
    Canvas.Font.Color:=Font.Color;
   end;
  if dmcon.ads279status3.Value=1 then
   Canvas.Font.Color := clred;

  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;

 DBGrid2Wnd := DBGrid2.WindowProc ;
 DBGrid2.WindowProc := NewGrid2Wnd;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dmcon.ads279.RecNo=dmcon.ads279.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
 if (key=112) and
    (dbcombobox1.Visible) and
    (dbcombobox1.Enabled) then
  begin                         //F1键出现下拉
   dbcombobox1.SetFocus;
   dbcombobox1.DroppedDown:=true;
  end;
end;

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if dmcon.ads279datatype.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;

if (key <> chr(9)) then
 begin
  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
     (dbcombobox1.Items.Count > 0) and
     (dbcombobox1.Enabled) then
   begin
    DBComboBox1.SetFocus;
    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm2.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then dbcombobox1.DroppedDown:=true; //F1键出现下拉
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 self.ModalResult:=mrcancel;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
//if dmcon.AQY0025RKEY.Value <> strtoint(rkey25.Caption) then
 if FisRefresh then
 begin
  self.update_notebook;
  dmcon.AQY0025.Close;
  dmcon.AQY0025.Parameters[0].Value:=strtoint(rkey25.Caption);
  dmcon.AQY0025.Open;
  FisRefresh:=false;   
  dmcon.AQY0025.Edit;
  dmcon.AQY0025LAST_MODIFIED_DATE.Value := getsystem_date(dmcon.adoquery1,1);
//  dmcon.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
 end;



screen.Cursor:=crappstart;
 if edit3.Text = '' then    //打开修订人员
 begin
  edit3.Text:=self.get_employeename(dmcon.AQY0025LAST_MODIFIED_BY_PTR.Value);
  edit4.Text:=self.get_employeename(dmcon.AQY0025CHECK_BY_PTR.Value);
  edit5.Text:=self.get_employeename(dmcon.AQY0025AUDITED_BY_PTR.Value);
  with dmcon.ADOQuery1 do
  begin
   close;
   sql.Text:='select PROD_CODE,PRODUCT_NAME from data0008'+#13+
             'where rkey='+dmcon.AQY0025PROD_CODE_PTR.AsString;
   open;
   edit1.Text:=fieldbyname('PROD_CODE').AsString;
   label15.Caption:=fieldbyname('PRODUCT_NAME').AsString;
  end;

  IF (dmcon.AQY0025PARENT_PTR.Value>0)  then
  begin
   dbedit32.Visible:=true;
   dbedit33.visible:=true;
   bitbtn12.visible:=true;
   label64.Visible:=true;
   label62.Visible:=true;
   label63.Visible:=true;
   label64.Caption:='';
    with dmcon.ADOQuery1 do
    begin
     close;
     sql.Text:='SELECT dbo.Data0038.STEP_NUMBER, dbo.Data0034.DEPT_CODE,'+#13+
        'dbo.Data0034.DEPT_NAME, dbo.Data0034.BARCODE_ENTRY_FLAG'+#13+
         'FROM dbo.Data0038 INNER JOIN'+#13+
        'dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
        'where data0038.SOURCE_PTR='+dmcon.AQY0025PARENT_PTR.AsString+#13+
        'and Data0038.STEP_NUMBER='+dmcon.AQY0025BOM_STEP.AsString;
     open;
     if not isempty then
      label64.Caption:=fieldbyname('DEPT_NAME').AsString;
    end;

  end
  else
  begin
   dbedit32.Visible:=false;
   dbedit33.Visible:=false;
   bitbtn12.Visible:=false;
   label64.Visible:=false;
   label64.Visible:=false;
   label62.Visible:=false;
   label63.Visible:=false;
  end;

 end;

 if not dmcon.ads502.Active then
 self.get_picturedata502(dmcon.AQY0025RKEY.Value); //打开拼版图

 if not dmcon.ads279.Active then
  self.get_data0279(dmcon.AQY0025RKEY.Value);       //打开全局参数

 if not dmcon.ADS38.Active then
 BEGIN
  dmcon.ADS38.Close;                         //打开工艺流程
  dmcon.ADS38.Parameters[0].Value:=dmcon.AQY0025RKEY.Value;
  dmcon.ADS38.Open;
  dmcon.ads494.Close;                      //制程参数
  dmcon.ads494.Parameters[0].Value:=dmcon.AQY0025RKEY.Value;
  dmcon.ads494.Open;
  if dmcon.AQY0025ENG_ROUTE_PTR.Value>0 then   //打开流程模型
  with dmcon.ADOQuery1 do
  begin
   close;
   sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
             'where rkey='+dmcon.AQY0025ENG_ROUTE_PTR.AsString;
   open;
   edit2.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
   label56.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
  end;
 END;

 if not isopen.Checked then
 self.get_drill(dmcon.AQY0025RKEY.Value);         //打开钻孔表

 if not memo2.ReadOnly then                    //打开ECN
  begin
   self.get_ecninfo(dmcon.AQY0025RKEY.Value);
   memo2.ReadOnly:=true;
  end;

 if not dmcon.ads89.Active then
  dmcon.ads89.Open;                                //打开评审信息

 if not memo3.ReadOnly then                    //打开客户特殊信息
  begin
   memo3.Text:=self.get_customer(dmcon.AQY0025CUSTOMER_PTR.Value);
   memo3.ReadOnly:=true;
  end;

 if Listbox1.Items[ListBox1.ItemIndex] = 'BOM' then
   notebook1.PageIndex:=11
 else
  if (Listbox1.Items[ListBox1.ItemIndex] = '===成本===') or
     (Listbox1.Items[ListBox1.ItemIndex] = '一类材料') then
   notebook1.PageIndex:=12
 else
  if (Listbox1.Items[ListBox1.ItemIndex] = '二类材料') then
   notebook1.PageIndex:=13
 else
  if (Listbox1.Items[ListBox1.ItemIndex] = '制造费用') then
   notebook1.PageIndex:=16
 else
  if (Listbox1.Items[ListBox1.ItemIndex] = '成本汇总') then
   notebook1.PageIndex:=14
 else
  if (Listbox1.Items[ListBox1.ItemIndex] = '成本分析') then
   notebook1.PageIndex:=15
 else
  notebook1.PageIndex:=listbox1.ItemIndex+1;

 headercontrol1.Sections[2].Text:=listbox1.Items[listbox1.ItemIndex];
 screen.Cursor:=crdefault;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
self.update_notebook();
  form2 := nil;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
self.get_ecninfo(dmcon.AQY0025RKEY.Value);
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
if strtoint(from_part_ptr.Caption)>0 then
 self.get_ecninfo(strtoint(from_part_ptr.Caption))
else
 messagedlg('变更记当已到最上层!',mtinformation,[mbcancel],0);
end;

procedure TForm2.DBEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dmcon.AQY0025spell_lngth.Value:=dmcon.AQY0025set_lngth.Value;

end;

procedure TForm2.DBEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dmcon.AQY0025spell_width.Value:=dmcon.AQY0025set_width.Value;
end;

procedure TForm2.DBEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dmcon.AQY0025spell_qty.Value:=dmcon.AQY0025set_qty.Value;
end;

procedure TForm2.DBEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dmcon.AQY0025set_lngth.Value:=dmcon.AQY0025pcs_lngth.Value;
end;

procedure TForm2.DBEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dmcon.AQY0025set_width.Value:=dmcon.AQY0025pcs_width.Value;
end;

procedure TForm2.DBEdit15KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
end;

procedure TForm2.DBEdit21KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
  abort;
end;

procedure TForm2.DBEdit21KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (trim((sender as TDBEdit).Text)='') or
   (trim((sender as TDBEdit).Text)='0') then
   (sender as TDBEdit).Text:='1';
end;

procedure TForm2.DBEdit17Exit(Sender: TObject);
begin
if dmcon.AQY0025.State=dsedit then
 dmcon.AQY0025unit_sq.Value:=dmcon.AQY0025set_lngth.Value*
                         dmcon.AQY0025set_width.Value*0.000001
                          /dmcon.AQY0025set_qty.Value;
end;

procedure TForm2.DBEdit19Exit(Sender: TObject);
begin
if dmcon.AQY0025.State=dsedit then
 dmcon.AQY0025spell_sq.Value:=dmcon.AQY0025spell_lngth.Value*
                         dmcon.AQY0025spell_width.Value*0.000001
                          /dmcon.AQY0025spell_qty.Value;
end;

procedure TForm2.DBGrid1ColExit(Sender: TObject);
begin
If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
 DBComboBox1.Visible := false;
end;

procedure TForm2.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if dmcon.ads279datatype.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
 dmcon.ads89.DisableControls;
 dmcon.ads279.DisableControls;
 dmcon.ADS279.First;
 while not dmcon.ads279.Eof do
 begin
  if dmcon.ads89.Locate('PARAMETER_NAME',dmcon.ads279PARAMETER_NAME.Value,[]) then
  begin
   dmcon.ADS279.Edit;
   dmcon.ads279PARAMETER_VALUE.Value:=dmcon.ads89tvalue.Value;
  end;
  dmcon.ads279.Next;
 end;
 dmcon.ads89.First;
 dmcon.ads279.First;
 dmcon.ads279.EnableControls;
 dmcon.ads89.EnableControls;

if find_spec_rkey('L') then //交货板面积
 begin
  dmcon.ads279.Edit;
  dmcon.ads279PARAMETER_VALUE.Value:=dmcon.AQY0025unit_sq.AsString;
  dmcon.ads279.Post;
  dmcon.ads279.First;
 end;

if find_spec_rkey('LY') then //层数
 begin
  dmcon.ads279.Edit;
  dmcon.ads279PARAMETER_VALUE.Value:=dmcon.AQY0025LAYERS.AsString;
  dmcon.ads279.Post;
  dmcon.ads279.First;
 end;

if find_spec_rkey('DZ') then //单元尺寸
 begin
  dmcon.ads279.Edit;
  dmcon.ads279PARAMETER_VALUE.Value:=dmcon.AQY0025pcs_lngth.AsString
                                       +'mm X '+dmcon.AQY0025pcs_width.AsString+'mm';
  dmcon.ads279.Post;
  dmcon.ads279.First;
 end;



end;

procedure TForm2.N3Click(Sender: TObject);  //编辑工序
begin
try
 form_flowpara:=tform_flowpara.Create(application);
 dmcon.ads494.Filter:='step_number='+dmcon.ADS38STEP_NUMBER.AsString;
 if form_flowpara.ShowModal=mrok then
 begin

 end;
finally
 form_flowpara.Free;
end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if dmcon.ADS38.IsEmpty then
 begin
  n3.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  n3.Enabled:=true;
  n4.Enabled:=true;
 end;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:integer;
begin
if button=mbright then
 begin
  (sender as tstringgrid).MouseToCell(x,y,column,row);
   if row<>0 then
  (sender as tstringgrid).Row:=row;
  (sender as tstringgrid).Col:=column;
 end;
end;

procedure TForm2.N7Click(Sender: TObject);
var
 i:word;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n6.Enabled:=false;
   n7.Enabled:=false;
  end
 else
  begin
   n6.Enabled:=true;
   n7.Enabled:=true;
  end;
end;

procedure TForm2.N6Click(Sender: TObject);
var
 i:word;
begin
 for i:=stringgrid1.RowCount-2 downto stringgrid1.Row do
  stringgrid1.Rows[i+1].Text:=stringgrid1.Rows[i].Text;
  stringgrid1.Rows[stringgrid1.Row].Text:='';
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
end;

procedure TForm2.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid1.Row=stringgrid1.RowCount-1) and
   (trim(stringgrid1.Rows[stringgrid1.Row].Text)<>'') then
 begin
  stringgrid1.Cells[0,stringgrid1.Row]:='T'+inttostr(stringgrid1.Row);
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
 end;

end;

procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (KEY=13) and (Stringgrid1.row<stringgrid1.RowCount-1) then
   Stringgrid1.row:=Stringgrid1.row+1;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (stringgrid1.Col=5) or (stringgrid1.Col=2) then
 try
  stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.00',
   strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]));
 except
 end;
 
if stringgrid1.Col=3 then
 stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
  uppercase(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]);

if (stringgrid1.Col=5) then
 edit6.Text:=formatfloat('0.00',(get_mindrill()));
end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
begin
if (stringgrid1.Col=5) or (stringgrid1.Col=2) then
 try
  stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.00',
   strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]));
 except
 end;
 
if stringgrid1.Col=3 then
 stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
  uppercase(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]);

if (stringgrid1.Col=5) then
 edit6.Text:=formatfloat('0.00',(get_mindrill()));
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var
 i:word;
begin
 for i:= 1 to stringgrid1.RowCount-2 do
 try
   if trim(stringgrid1.Cells[3,i])='Y' then
    stringgrid1.Cells[5,i]:=formatfloat('0.00',
                            strtofloat(stringgrid1.Cells[2,i])+
                            strtofloat(edit7.Text))

  else
   if trim(stringgrid1.Cells[3,i])='N' then
    stringgrid1.Cells[5,i]:=formatfloat('0.00',
                            strtofloat(stringgrid1.Cells[2,i])+
                            strtofloat(edit8.Text));

 except

 end;
 edit6.Text:=formatfloat('0.00',(get_mindrill())); 
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
var
 i:word;
begin
 for i:= 1 to stringgrid1.RowCount-2 do
 try
  if (trim(stringgrid1.Cells[3,i])='Y') and
     (roundto(strtofloat(stringgrid1.Cells[5,i]),-2)<>
      roundto(strtofloat(stringgrid1.Cells[2,i])+strtofloat(edit7.Text),-2)) then

    messagedlg('第'+inttostr(i)+'行钻咀:'+stringgrid1.Cells[2,i]+'不符沉铜孔偏差'
    ,mtinformation,[mbcancel],0)
  else
   if (trim(stringgrid1.Cells[3,i])='N') and
     (roundto(strtofloat(stringgrid1.Cells[5,i]),-2)<>
      roundto(strtofloat(stringgrid1.Cells[2,i])+strtofloat(edit8.Text),-2)) then
    messagedlg('第'+inttostr(i)+'行钻咀:'+stringgrid1.Cells[2,i]+'不符非沉铜孔偏差'
    ,mtinformation,[mbcancel],0);
 except

 end;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
var
pnla_pcs,pnlb_pcs,i:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLA单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

for i:=1 to stringgrid1.RowCount-2 do
begin
 try
  if pnla_pcs>0 then
   Stringgrid1.Cells[7,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[6,i]))*pnla_pcs+1);
  if pnlb_pcs>0 then
   Stringgrid1.Cells[8,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[6,i]))*pnlb_pcs+1);
 except

 end;
end;
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
var
 i,total_a,total_b:integer;
begin
 total_a:=0;
 total_b:=0;
 if pos('Total',stringgrid1.Cells[6,stringgrid1.RowCount-2])>0 then
 if messagedlg('孔数已经汇总是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
  exit;

 try
 for i:=1 to stringgrid1.RowCount-2 do
  begin
   if trim(Stringgrid1.Cells[7,i])<>'' then
   total_a := total_a+strtoint(Stringgrid1.Cells[7,i]);
   if trim(Stringgrid1.Cells[8,i])<>'' then
   total_b := total_a+strtoint(Stringgrid1.Cells[8,i]);
  end;
 except
  messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
  exit;
 end;

stringgrid1.Cells[6,stringgrid1.RowCount-1]:='Total:';
if total_a>0 then
stringgrid1.Cells[7,stringgrid1.RowCount-1]:=inttostr(total_a);
if total_b>0 then
stringgrid1.Cells[8,stringgrid1.RowCount-1]:=inttostr(total_b);
stringgrid1.RowCount:=stringgrid1.RowCount+1;
end;

procedure TForm2.DBEdit15Exit(Sender: TObject);
begin
if dmcon.AQY0025.State=dsedit then
 dmcon.AQY0025pcs_sq.Value:=dmcon.AQY0025pcs_lngth.Value*
                         dmcon.AQY0025pcs_width.Value*0.000001;
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  rkey25.Caption:=inttostr(Pinteger(Node.data)^);
  FisRefresh:=true;
  SetButtonState;
  
  dmcon.Open_Cost_Data(StrToInt(rkey25.Caption));
  Show_Cost_Summary;

  dmcon.aqBOMView.Close;
  dmcon.aqBOMView.Parameters[0].Value := StrToInt(rkey25.Caption);
  dmcon.aqBOMView.Open;

 notebook1.PageIndex:=0;
 node.SelectedIndex:=4;

 if node.Level =0 then
 listbox1.Items.Text:=
 '产品信息'+#13+
 '拼版设计'+#13+
 '全局参数'+#13+
 '工艺流程'+#13+
 '层压结构'+#13+
 '钻咀表'+#13+
 '备注信息'+#13+
 '工程更改'+#13+
 '评审信息'+#13+
 '客户信息'+#13+
 'BOM'+#13+
 '===成本==='+#13+
 '一类材料'+#13+
 '二类材料'+#13+
 '制造费用'+#13+
 '成本汇总'+#13+
 '成本分析'
 else
 listbox1.Items.Text:=
 '产品信息'+#13+
 '拼版设计'+#13+
 '全局参数'+#13+
 '工艺流程'+#13+
 '层压结构'+#13+
 '钻咀表'+#13+
 '备注信息'+#13+
 'BOM'+#13+
 '===成本==='+#13+
 '一类材料'+#13+
 '二类材料'+#13+
 '制造费用'+#13+
 '成本汇总'+#13+
 '成本分析';
end;

procedure TForm2.N10Click(Sender: TObject);
begin
{try
 form_flowpara:=tform_flowpara.Create(application);
 dmcon.ads494.Filter:='step_number='+dmcon.ADS38STEP_NUMBER.AsString;
 with form_flowpara do
  begin
   bitbtn2.Enabled:=false;
   dbmemo1.Enabled:=false;
   dbedit4.Enabled:=false;
   dbedit5.Enabled:=false;
   dbgrid1.PopupMenu:=nil;
   dbcombobox1.Enabled:=false;
   dbgrid1.Columns[5].ReadOnly:=true;
   dbgrid1.Columns[6].ReadOnly:=true;
   dbgrid1.Columns[7].ReadOnly:=true;
   dbgrid1.Columns[8].ReadOnly:=true;
   dbgrid1.Columns[9].ReadOnly:=true;
  end;

 if form_flowpara.ShowModal=mrok then
 begin

 end;
finally
 form_flowpara.Free;
end;}
try
 form_flowpara:=tform_flowpara.Create(application);
 dmcon.ads494.Filter:='step_number='+dmcon.ADS38STEP_NUMBER.AsString;
 if form_flowpara.ShowModal=mrok then
 begin

 end;
finally
 form_flowpara.Free;
end;

end;



procedure TForm2.FormShow(Sender: TObject);
begin
 self.get_treedate(dmcon.AQY0025RKEY.Value,treeview1);
 notebook1.PageIndex:=0;
 stringgrid1.Cells[0,0]:='序';
 stringgrid1.Cells[1,0]:='刀具';
 stringgrid1.Cells[2,0]:='符号';
 stringgrid1.Cells[3,0]:='成品孔径';
 stringgrid1.Cells[4,0]:='PTH';
 stringgrid1.Cells[5,0]:='公差';
 stringgrid1.Cells[6,0]:='钻咀';
 stringgrid1.Cells[7,0]:='PCS孔数';
 stringgrid1.Cells[8,0]:='SET孔数';
 stringgrid1.Cells[9,0]:='A板孔数';
 stringgrid1.Cells[10,0]:='B板孔数';
 stringgrid1.Cells[11,0]:='备注';


  dbedit1.Enabled:=false;
  dbedit2.Enabled:=false;
  dbedit3.Enabled:=false;
  dbedit4.Enabled:=false;
  dbedit5.Enabled:=false;
  dbedit6.Enabled:=false;
  dbedit7.Enabled:=false;
  dbedit8.Enabled:=false;
  dbedit9.Enabled:=false;
  dbedit10.Enabled:=false;
  dbedit11.Enabled:=false;
  dbedit14.Enabled:=false;
  dbradiogroup1.Enabled:=false;
  dbcheckbox1.Enabled:=false;
  bitbtn12.Enabled:=false;
  bitbtn13.Enabled:=false;
  dbedit32.Enabled:=false;
  dbedit33.Enabled:=false;

  dbedit15.Enabled:=false;
  dbedit16.Enabled:=false;
  dbedit17.Enabled:=false;
  dbedit18.Enabled:=false;
  dbedit19.Enabled:=false;
  dbedit20.Enabled:=false;
  dbedit21.Enabled:=false;
  dbedit22.Enabled:=false;
  dbcombobox2.Enabled:=false;
  bitbtn3.Enabled:=false;

  speedbutton1.Enabled:=false;
  speedbutton2.Enabled:=false;
  dbcombobox1.Enabled:=false;
  dbgrid1.Columns[4].ReadOnly:=true;
  bitbtn4.Enabled:=false;
  dbgrid2.PopupMenu:=self.PopupMenu5;
  speedbutton3.Enabled:=false;
  dbmemo1.ReadOnly:=true;
  dbmemo1.PopupMenu:=nil;
  bitbtn5.Enabled:=false;
  bitbtn6.Enabled:=false;
  bitbtn7.Enabled:=false;
  bitbtn8.Enabled:=false;
  stringgrid1.Options:=stringgrid1.Options+[gorowselect];
  stringgrid1.PopupMenu:=nil;
  bitbtn9.Enabled:=false;
  bitbtn10.Enabled:=false;
  dbmemo2.ReadOnly:=true;
  dbmemo3.ReadOnly:=true;
  dbmemo4.ReadOnly:=true;

 if strtoint(status.Caption)=1 then   //检查状态
 begin
   btnBOM.Enabled:=false;
   btnApprove.Enabled:=false;
   btnRollback.Enabled:=false;
 end;
end;

procedure TForm2.btnBOMClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    ShowMsg('对不起!您没有该程序的可写权限',1);
    exit;
  end;
  if not Msg_Dlg_Ask('更新产品时,系统会自动更新该产品所有内层产品的成本,确定做产品成本更新吗?','提示',1) then exit;
  try
    Screen.Cursor := crHourGlass;
    with dmcon do begin
      spCostUpdate.Parameters.ParamByName('@rKey').Value :=StrToInt(rkey25.Caption);
      spCostUpdate.ExecProc;
      if spCostUpdate.Parameters.ParamByName('@RETURN_VALUE').Value <> 0 then
       begin
        ShowMsg('更新产品成本失败!',1);
        exit;
       end
      else
        ShowMsg('更新产品成本成功!',1);
      aqCostSum.Close;
      aqCostSum.Parameters[0].Value := StrToInt(rkey25.Caption);
      aqCostSum.Open;
      aqProducingCost.Close;
      aqProducingCost.Parameters[0].Value := StrToInt(rkey25.Caption);
      aqProducingCost.Open;
      Show_Cost_Summary;//刷新成本分析数据
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm2.Show_Cost_Summary;
var
  sqlstr:string;
  aqTmp:TAdoQuery;
  Matl1,Matl2,sub_cost,total,Scrap_rate,SET_Qty,SQMT_Qty,PCS_Qty,ExchRate,P_Cost,P_Sub_Cost,P_Total:double;
begin
  sqlstr:='select *,Matl1+Matl2+sub_cost as Total,P_Cost + P_Sub_Cost as P_Total from( '+
          ' select sum(IsNULL(Matl_Per_SQFT_1,0)) as Matl1, sum(IsNULL(Matl_Per_SQFT_2,0)) as matl2,sum(IsNULL(sub_Matl_Cost,0)) as sub_cost,sum(IsNULL(ProducingCost,0)) as P_Cost,sum(IsNULL(Sub_Producing_Cost,0)) as P_Sub_Cost from data0460  where bom_ptr='+rkey25.Caption+')D';
  try
    aqTmp:= TAdoQuery.Create(self);
    aqTmp.Connection := dmcon.ADOConnection1;
    aqTmp.SQL.Clear;
    aqTmp.SQL.Add(sqlstr);
    aqTmp.Open;
    Matl1:=aqTmp.fieldbyName('Matl1').AsFloat;
    Matl2:=aqTmp.fieldbyName('Matl2').AsFloat;
    total:=aqTmp.fieldbyName('Total').AsFloat;
    P_Cost:=aqTmp.fieldbyName('P_Cost').AsFloat;
    P_Sub_Cost:=aqTmp.fieldbyName('P_Sub_Cost').AsFloat;
    P_total:=aqTmp.fieldbyName('P_total').AsFloat;
    Sub_cost:=aqTmp.fieldbyName('sub_cost').AsFloat;
    sqlstr:='select EST_SCRAP,unit_sq,Set_qty from data0025 where rkey='+rkey25.Caption;
    aqTmp.SQL.Clear;
    aqTmp.SQL.Add(sqlstr);
    aqTmp.Open;
    SQMT_Qty:= aqTmp.FieldByName('unit_sq').Value;
    SET_Qty:= aqTmp.FieldByName('set_qty').Value;
    Scrap_rate:=aqTmp.FieldByName('EST_SCRAP').AsFloat/100;
  finally
    aqTmp.close;
    aqTmp.free;
  end;
  with dmcon do begin
     Label73.Caption := '报废率: '+format('%3.2f%%',[Scrap_rate*100]);
     if ComboBox1.Text='平方米' then
       ExchRate:=1
     else if ComboBox1.Text='PCS' then
       ExchRate:=SQMT_Qty
     else if ComboBox1.Text='SET' then
       ExchRate:=SQMT_Qty*SET_Qty;
     edtMatl_1_Basic.Text := format('%8.5f',[Matl1*ExchRate]);
     edtMatl_1_Scrap.Text := format('%8.5f',[Matl1*ExchRate*Scrap_rate]);
     edtMatl_1_Total.Text := format('%8.5f',[Matl1*ExchRate*(1+Scrap_rate)]);

     edtMatl_2_Basic.Text := format('%8.5f',[Matl2*ExchRate]);
     edtMatl_2_Scrap.Text := format('%8.5f',[Matl2*ExchRate*Scrap_rate]);
     edtMatl_2_Total.Text := format('%8.5f',[Matl2*ExchRate*(1+Scrap_rate)]);

     edtOut_Basic.Text := format('%8.5f',[Sub_cost*ExchRate]);
     edtOut_Scrap.Text := format('%8.5f',[Sub_cost*ExchRate*Scrap_rate]);
     edtOut_Total.Text := format('%8.5f',[Sub_cost*ExchRate*(1+Scrap_rate)]);

     edtBasic_sum.Text := format('%8.5f',[total*ExchRate]);
     edtScrap_sum.Text := format('%8.5f',[total*ExchRate*Scrap_rate]);
     edtTotal_Sum.Text := format('%8.5f',[total*ExchRate*(1+Scrap_rate)]);

     edtP_Basic.Text := format('%8.5f',[P_Cost*ExchRate]);
     edtP_Scrap.Text := format('%8.5f',[P_Cost*ExchRate*Scrap_rate]);
     edtP_Total.Text := format('%8.5f',[P_Cost*ExchRate*(1+Scrap_rate)]);

     edtP_Out_Basic.Text := format('%8.5f',[P_Sub_Cost*ExchRate]);
     edtP_Out_Scrap.Text := format('%8.5f',[P_Sub_Cost*ExchRate*Scrap_rate]);
     edtP_Out_Total.Text := format('%8.5f',[P_Sub_Cost*ExchRate*(1+Scrap_rate)]);

     edtP_Basic_Sum.Text := format('%8.5f',[P_total*ExchRate]);
     edtP_Scrap_Sum.Text := format('%8.5f',[P_total*ExchRate*Scrap_rate]);
     edtP_Total_Sum.Text := format('%8.5f',[P_total*ExchRate*(1+Scrap_rate)]);
     
     edtBasic_Total.Text := format('%8.5f',[(P_total+Total)*ExchRate]);
     edtScrap_Total.Text := format('%8.5f',[(P_total+Total)*ExchRate*Scrap_rate]);
     edt_Total_All.Text := format('%8.5f',[(P_total+Total)*ExchRate*(1+Scrap_rate)]);
     if dmcon.AQY0025.FieldByName('LATEST_PRICE').AsFloat <>0 then
     begin
       labelCostRate.Caption:= trim(format('%8.2f',[(P_total+Total)*(1+Scrap_rate)*SQMT_Qty/dmcon.AQY0025.FieldByName('LATEST_PRICE').AsFloat*100])+'%');
       if SQMT_Qty <> 0 then
       labelPrice_SQM.Caption:=trim(format('%8.3f',[dmcon.AQY0025.FieldByName('LATEST_PRICE').AsFloat/SQMT_Qty]));
     end;
     edt_self_basic.Text := format('%8.5f',[(Matl1+Matl2+P_Cost)*ExchRate]);
     edt_Self_Scrap.Text := format('%8.5f',[(Matl1+Matl2+P_Cost)*ExchRate*Scrap_rate]);
     edt_Self_Total.Text := format('%8.5f',[(Matl1+Matl2+P_Cost)*ExchRate*(1+Scrap_rate)]);

     edt_Out_Basic.Text := format('%8.5f',[(Sub_cost+P_Sub_Cost)*ExchRate]);
     edt_Out_Scrap.Text := format('%8.5f',[(Sub_cost+P_Sub_Cost)*ExchRate*Scrap_rate]);
     edt_Out_Total.Text := format('%8.5f',[(Sub_cost+P_Sub_Cost)*ExchRate*(1+Scrap_rate)]);
  end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  Show_Cost_Summary;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
var
  SET_Qty,SQMT_Qty,PCS_Qty,ExchRate:double;
  BK:TBookmark;
begin
{PCS
SET
出货平方米}
  with dmcon do begin
  SQMT_Qty:= AQY0025unit_sq.Value;
  SET_Qty:= AQY0025set_qty.Value;
  with form2 do begin
    if ComboBox2.ItemIndex =2 then
       ExchRate:=1
     else if ComboBox2.ItemIndex=0 then
       ExchRate:=SQMT_Qty
     else if ComboBox2.ItemIndex=1 then
       ExchRate:=SQMT_Qty*SET_Qty;
  end;
//  if Exchrate = 1 then exit;
  BK:=aqCostSum.GetBookmark;
  aqCostSum.DisableControls;
  try
    aqCostSum.first;
    while not aqCostSum.eof do begin
      aqCostSum.edit;
      aqCostSum.FieldByName('Matl1').Value := aqCostSum.FieldByName('MATL_PER_SQFT_1').asfloat*Exchrate;
      aqCostSum.FieldByName('Matl2').Value := aqCostSum.FieldByName('MATL_PER_SQFT_2').asfloat*Exchrate;
      aqCostSum.FieldByName('Sub_Cost').Value := aqCostSum.FieldByName('Sub_Matl_Cost').asfloat*Exchrate;
      aqCostSum.FieldByName('PCost1').Value := aqCostSum.FieldByName('OVERHEAD_PER_SQFT').asfloat*Exchrate;
      aqCostSum.FieldByName('PCost2').Value := aqCostSum.FieldByName('OVERHEAD2_PER_SQFT').asfloat*Exchrate;
      aqCostSum.FieldByName('PCost3').Value := aqCostSum.FieldByName('OVERHEAD3_PER_SQFT').asfloat*Exchrate;
      aqCostSum.FieldByName('PCost').Value := aqCostSum.FieldByName('TOT_ACCU_OVHD_PER_SQFT').asfloat*Exchrate;
      aqCostSum.FieldByName('MCost').Value := aqCostSum.FieldByName('TOT_ACCU_MATL_PER_SQFT').asfloat*Exchrate;
      aqCostSum.FieldByName('Sub_P_Cost').Value := aqCostSum.FieldByName('Sub_Producing_Cost').asfloat*Exchrate;
      aqCostSum.post;
      aqCostSum.next;
    end;
  finally
    if BK <> nil then
      aqCostSum.GotoBookmark(bk);
    aqCostSum.EnableControls;
  end;
  end;
end;

procedure TForm2.btnApproveClick(Sender: TObject);
var
  rKey:string;
begin

  if Msg_Dlg_Ask('确认审核产品成本吗?','提示',1) then
  begin
   // rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
    rKey:=dmcon.AQY0025.FieldByName('rkey').AsString;
    dmcon.tmp.Close;
    if TreeView1.Selected.Parent=nil then
      dmcon.tmp.SQL.Text:=' update data0025 set BOM_status=4,cost_appr_by='+user_ptr+',cost_appr_date=getdate() where BOM_status=1 and rKey='+rKey
    else
      dmcon.tmp.SQL.Text:=' update data0025 set BOM_status=4,cost_appr_by='+user_ptr+',cost_appr_date=getdate() where rKey='+rKey ;
    if dmcon.tmp.ExecSQL<>1  then
      ShowMsg('数据状态发生变化,更新失败!',1)
    else
      SetButtonState;

  end;
end;

procedure TForm2.btnRollbackClick(Sender: TObject);
var
  rKey:string;
begin
  if Msg_Dlg_Ask('确认取消审核产品成本吗?','提示',1) then
  begin
    rKey:=dmcon.AQY0025.FieldByName('rkey').AsString;// dmcon.adsProdLists.FieldByname('rKey').AsString;
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text:='update data0025 set BOM_status=1,cost_appr_by=NULL,cost_appr_date=null where not cost_appr_by is null and rKey='+rKey;
    if dmcon.tmp.ExecSQL<>1  then
      ShowMsg('数据状态发生变化,更新失败!',1)
    else
      SetButtonState;
  end;
end;

procedure TForm2.SetButtonState;
begin
  if  form2.status.Caption='1' then exit;

  dmcon.AQY0025.Close;
  dmcon.AQY0025.Parameters[0].Value:=strtoint(rkey25.Caption);
  dmcon.AQY0025.Open;

  btnApprove.Enabled := dmcon.AQY0025.FieldByName('cost_appr_by').IsNull;
  btnRollback.Enabled := not btnApprove.Enabled;
  btnBOM.Enabled := btnApprove.Enabled;
end;

procedure TForm2.EXCEL1Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(Dbgrid4,dmcon.AQY0025MANU_PART_NUMBER.Value+'BOM物料清单');
end;

procedure TForm2.EXCEL2Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(dbgrideh1,dmcon.AQY0025MANU_PART_NUMBER.Value+'一类物料清单');
end;

procedure TForm2.EXCEL3Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(dbgrideh2,dmcon.AQY0025MANU_PART_NUMBER.Value+'二类物料清单');
end;

procedure TForm2.EXCEL4Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(dbgrideh3,dmcon.AQY0025MANU_PART_NUMBER.Value+'成本汇总');
end;

procedure TForm2.EXCEL5Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(dbgrideh4,dmcon.AQY0025MANU_PART_NUMBER.Value+'制造费用');
end;

procedure TForm2.BitBtnDriToExcelClick(Sender: TObject);
begin
Export_Grid_to_Excel(stringgrid1,dmcon.AQY0025MANU_PART_NUMBER.Value+'钻咀表');
end;

procedure TForm2.n8Click(Sender: TObject);
var
  LRet: string;
begin
  LRet := InputBox('修改标准消耗','',dmcon.aqPrimaryMatl.fieldbyname('qty_bom').AsString);
  if StrToFloatDef(LRet,-1) < 0 then
  begin
    ShowMessage('标准消耗输入错误');
    Exit;
  end else
  begin
    dmcon.aqPrimaryMatl.Edit;
    dmcon.aqPrimaryMatl.fieldbyname('qty_bom').AsString := LRet;
    dmcon.aqPrimaryMatl.Post;
    dmcon.aqPrimaryMatl.UpdateBatch();
    ShowMessage('标准修改完成，请更新计算标准成本');
  end;
end;

procedure TForm2.PopupMenu7Popup(Sender: TObject);
var
  i: Integer;
begin
  i:=dmcon.adsProdLists.FieldByName('BOM_status').Asinteger;

  n8.Enabled:= (i=1) and ((vprev='2') or (vprev='4')) ;
end;

end.
