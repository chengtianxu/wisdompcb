unit product_MIDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, DBCtrls, Mask,
  Grids, DBGrids, Menus, DB, ADODB,math,Clipbrd, jpeg;
type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Btnsave: TBitBtn;
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
    Label56: TLabel;
    DBCheckBox4: TDBCheckBox;
    Label57: TLabel;
    Label58: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    rkey25: TLabel;
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
    N11: TMenuItem;
    N12: TMenuItem;
    Label65: TLabel;
    Label66: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N18: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    BitBtn16: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn24: TBitBtn;
    PopupMenu6: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N25: TMenuItem;
    SET1: TMenuItem;
    SET2: TMenuItem;
    PopupMenu7: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    OpenDialog1: TOpenDialog;
    N110: TMenuItem;
    N111: TMenuItem;
    N39: TMenuItem;
    spl1: TSplitter;
    Panel17: TPanel;
    Image4: TImage;
    Panel19: TPanel;
    StringGrid3: TStringGrid;
    Panel21: TPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    ComboBox2: TComboBox;
    PopupMenu13: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    imgCY: TImage;
    btn7: TBitBtn;
    dbedt1: TDBEdit;
    lbl1: TLabel;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
    procedure BtnsaveClick(Sender: TObject);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu3Popup(Sender: TObject);
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
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure N10Click(Sender: TObject);
    procedure btnBOMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure SET1Click(Sender: TObject);
    procedure SET2Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PopupMenu13Popup(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
      
  private
    { Private declarations }
   FDrillChg,FTargetChg,target:boolean;
   FisInit:boolean;
   strow,file_name:Tstringlist; //用于交换的字符串,用于存储上传的工程文档

   procedure get_picturedata502(rkey25:integer);
   procedure get_value(rkey278:integer);
   procedure get_data0279(rkey25:integer);

   procedure  get_drill(rkey25:integer);
   function get_employeename(rkey05: integer):string;
   function get_mindrill():single;
   function get_customer(rkey10:integer):string;
   procedure get_target(rkey25:integer);
   procedure update_target(rkey25:integer);
   procedure update_notebook();
   procedure get_ecninfo(to_part_ptr:integer);
   function find_spec_rkey(spec_rkey: string): boolean;
   procedure update_tecparameter(rkey25:integer);
   procedure update_drill(rkey25:integer);
   function get_date0025toprkey(rkey25: integer):integer;
   procedure get_treedate(rkey25:integer;treeview:Ttreeview);
   procedure Paste(var str:string);

   function get_drTrow(row:integer):string;
   function isDriilChg:boolean;
   function isTargetChg:boolean;
   function hz_jiajian(str:string;jia_or_jian:byte):string;
   function dr_jishuan(dr:single):single;
   function isnum(str:string):boolean;
   function find_33null():boolean;
  public
    EnterMode:byte;
    { Public declarations }
  end;

type
 TMyDBGrid=class(TDBGrid);

var
 Form2: TForm2;

implementation

uses dm, common,MyClass, flowpara_edit, Bom_Edit,ConstVar,FileReadWriteUnitClass, drcacle, PickEngNote,
Excel2000;


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
 target:=false;          //压合靶矩表需要重新打开
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
  min_drill:= StrToCurrDef( stringgrid1.Cells[5,1],0);
 except
  min_drill:=0;
 end;

 if stringgrid1.RowCount>3 then
 for i:=2 to stringgrid1.RowCount-2 do
 begin
  try
   strtofloatdef(stringgrid1.Cells[5,i],0);
  except
   Continue;
  end;
  if  strtofloatdef(stringgrid1.Cells[5,i],0) < min_drill then
   min_drill:= strtocurrdef( stringgrid1.Cells[5,i],0);
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
var i:integer;
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
  'UNIT, SET_UNMBER,PANEL_A, PANEL_B, SEQ_NO,REMARK'+#13+
  'FROM dbo.Data0029'+#13+
  'where source_ptr='+inttostr(rkey25);
  open;
 end;
  for i:=1 to stringgrid1.RowCount-2 do
   dmcon.ADOQuery1.AppendRecord([rkey25,
                              stringgrid1.Cells[1,i],
                              stringgrid1.Cells[2,i],
                              stringgrid1.Cells[3,i],
                              stringgrid1.Cells[4,i],
                              stringgrid1.Cells[5,i],
                              stringgrid1.Cells[6,i],
                              stringgrid1.Cells[7,i],
                              stringgrid1.Cells[8,i],                              
                              stringgrid1.Cells[9,i],
                              stringgrid1.Cells[10,i],
                              i,
                              stringgrid1.Cells[11,i]]);
end;

procedure  TForm2.get_drill(rkey25:integer);
var i:integer;
begin
for i:=1 to stringgrid1.RowCount-2 do  stringgrid1.Rows[i].Clear;
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

 LNode: TTreeNode;
 LPRkey25: PInteger1;
 LNodeArr: array of TTreeNode;
 I: Integer;
 n: Integer;
 LSql: string;
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
 if (dmcon.FTag=0) and (dmcon.FD494Modified  or  isDriilChg)  and
        (messagedlg('是否保存您编辑的数据?',mtconfirmation,[mbyes,mbno],0)=mryes) then  BtnsaveClick(nil);

 self.ModalResult:=mrcancel;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
  LCYImg: TjpegImage;
begin
  if not FisInit or (dmcon.AQY0025RKEY.Value <> strtoint(rkey25.Caption)) then
  begin
    if  FisInit and (dmcon.FTag=0) and (dmcon.FD494Modified or isDriilChg) and
        (messagedlg('更换线路层编辑,是否保存当前层数据?',mtconfirmation,[mbyes,mbno],0)=mryes) then
     BtnsaveClick(nil);

    FisInit:=true;
    dmcon.FD494Modified:=false;
    FDrillChg:=false;
    FTargetChg:=false;

    self.update_notebook;
    dmcon.AQY0025.Close;
    dmcon.AQY0025.Parameters[0].Value:=strtoint(rkey25.Caption);
    dmcon.AQY0025.Open;

    if dmcon.FTag = 5 then
    begin
      dbedt1.Enabled:= (strtoint(vprev) = 2)  and dmcon.AQY0025MinRing.IsNull;
      btn7.Visible:= (strtoint(vprev) = 2) and dmcon.AQY0025MinRing.IsNull;
    end
    else if dmcon.FTag = 0 then
    begin
      dbedt1.Enabled:= True;
      btn7.Visible:= True;
    end
    else
    begin
      dbedt1.Enabled:= False;
      btn7.Visible:= False;
    end;

    dmcon.AQY0025.Edit;
    dmcon.AQY0025LAST_MODIFIED_DATE.Value := getsystem_date(dmcon.adoquery1,1);
  end;

 if not VarIsNull(dmcon.AQY0025.FieldByName('layers_image').Value) then
 begin
  LCYImg := Load_JPG_Pic_From_DB(dmcon.AQY0025.FieldByName('layers_image'));
  imgCY.Picture.Bitmap.Assign(LCYImg);
  LCYImg.Free;
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

  if (dmcon.AQY0025PARENT_PTR.Value>0)  then
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
  if dmcon.AQY0025ENG_ROUTE_PTR.Value>0 then
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

 if not target then
 self.get_target(dmcon.AQY0025RKEY.Value);     //打开压合靶矩表

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
   notebook1.PageIndex:=12
 else
   notebook1.PageIndex:=listbox1.ItemIndex+1;

 headercontrol1.Sections[2].Text:=listbox1.Items[listbox1.ItemIndex];
 screen.Cursor:=crdefault;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.update_notebook();
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

procedure TForm2.BtnsaveClick(Sender: TObject);
begin
  //if MessageBox(handle,pchar('注意:保存后原有的BOM将会删除,'+#13+'您确定保存当前钻孔表吗?'),pchar('提示'),MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)<>IDYES	then exit;
    if not FDrillChg then isDriilChg ;
    if not FTargetChg then isTargetChg;
    if dmcon.FD494Modified or FDrillChg or FTargetChg then
    try
      dmcon.ADOConnection1.BeginTrans;
      if dmcon.FD494Modified then
      begin
        dmcon.ads494.Filter:='';
        dmcon.ads494.UpdateBatch(arAll);
      end;
      dmcon.tmp.Close;
      dmcon.tmp.SQL.Text:='update data0025 set candidate_BY='+user_ptr+', candidate_DATE=getdate() where TStatus=1 and BOM_STATUS=0 and rKey='+dmcon.adsProdLists.FieldByname('rKey').AsString;
      if dmcon.tmp.ExecSQL<>1 then
      begin
        dmcon.ADOConnection1.RollbackTrans;
        showmessage('记录状态已经发生变化!');
        exit;
      end;
      if FDrillChg then self.update_drill(dmcon.AQY0025RKEY.Value);//更新钻孔表
      if FTargetChg then self.update_target(dmcon.AQY0025RKEY.Value);//更新压合靶矩表

      FDrillChg:=false;
      FTargetChg:=false;
      dmcon.FD494Modified:=false;
      dmcon.ADOConnection1.CommitTrans;
      showmessage('MI后补已经成功保存!');
      dmcon.aqBOMView.Close;
      dmcon.aqBOMView.Open;
    except
      on E: Exception do
      begin
        dmcon.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end
    else
      showmessage('您未做任何修改!');
end;

procedure TForm2.DBEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dmcon.AQY0025set_width.Value:=dmcon.AQY0025pcs_width.Value;
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

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:integer;
begin
if button=mbright then
 begin
  (sender as tstringgrid).MouseToCell(x,y,column,row);
   if row<>0 then
  (sender as tstringgrid).Row:=row;
  (sender as tstringgrid).Col:=column;
 end;
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n6.Enabled:=false;
   n7.Enabled:=false;
   n16.Enabled:=false;
  end
 else
  begin
   n6.Enabled:=true;
   n7.Enabled:=true;
   n16.Enabled:=true;
  end;
 if stringgrid1.Row=1 then
  n15.Enabled:=false
 else
  n15.Enabled:=true;
 n18.Enabled:=stringgrid1.RowCount>2;
end;

procedure TForm2.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid1.Row=stringgrid1.RowCount-1) and
   (trim(stringgrid1.Rows[stringgrid1.Row].Text)<>'') then
 begin
  stringgrid1.Cells[0,stringgrid1.Row]:=inttostr(stringgrid1.Row);
  stringgrid1.Cells[1,stringgrid1.Row]:='T'+get_drTrow(stringgrid1.Row);
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
 end;
end;

procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (KEY=13) and (Stringgrid1.row<stringgrid1.RowCount-1) then
   Stringgrid1.row:=Stringgrid1.row+1;
 if (chr(key)='D') and (ssCtrl in shift) and (stringgrid1.Row>1) then
  begin
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:=
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row-1];
  end;

if (chr(key)='R') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 MenuItem1Click(sender);           //PCS计算单行孔数
if (chr(key)='A') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 MenuItem2Click(sender);           //PCS计算全部孔数

if (chr(key)='Y') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 SET1Click(sender);           //set计算单行孔数
if (chr(key)='N') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 SET2Click(sender);           //set计算全部孔数

if (chr(key)='T') and (ssCtrl in shift) and (bitbtn8.Enabled) then
 n13click(sender);          //孔数汇总
if (chr(key)='B') and (ssCtrl in shift) and (bitbtn8.Enabled) then
 n14click(sender);          //孔数公式汇总
if (key=187)  and (ssCtrl in shift) and (bitbtn8.Enabled) then
 N110click(sender);
if (key=189)  and (ssCtrl in shift) and (bitbtn8.Enabled) then
 N111click(sender);
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (stringgrid1.Col=6)  then
 try //最少保留两位小数

 if length(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])-
    pos('.',stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])<=2 then

  stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.00',
   strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]));

 except
 end;

if stringgrid1.Col=4 then
 stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
  uppercase(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]);

if (stringgrid1.Col=6) then
 edit6.Text:=formatfloat('0.00',(get_mindrill()));

end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
begin
if (stringgrid1.Col=6)  then
 try //最少保留两位小数

 if length(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])-
    pos('.',stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])<=2 then

  stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.00',
   strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]));

 except
 end;

if stringgrid1.Col=4 then
 stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
  uppercase(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]);

if (stringgrid1.Col=6) then
 edit6.Text:=formatfloat('0.00',(get_mindrill()));
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var
 i:word;
begin
if messagedlg('您是否设定好PTH及PTH与NPTH的偏差?',mtconfirmation,[mbno,mbok],0)=mrok then
begin

 for i:= 1 to stringgrid1.RowCount-2 do
 try
   if trim(stringgrid1.Cells[4,i])='Y' then
    stringgrid1.Cells[6,i]:=formatfloat('0.00',
                            dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+
                            strtofloat(edit7.Text))

  else
   if trim(stringgrid1.Cells[4,i])='N' then
    stringgrid1.Cells[6,i]:=formatfloat('0.00',
                            dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+
                            strtofloat(edit8.Text));

 except

 end;
 edit6.Text:=formatfloat('0.00',(get_mindrill()));
end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
var
 i:word;
 err:boolean;
begin
 err:=false;
 for i:= 1 to stringgrid1.RowCount-2 do
 try
  if (trim(stringgrid1.Cells[4,i])='Y') and
     (roundto(strtofloat(stringgrid1.Cells[6,i]),-2)<>
      roundto(dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+strtofloat(edit7.Text),-2)) then
   begin
    messagedlg('第'+inttostr(i)+'行钻咀:'+stringgrid1.Cells[3,i]+'不符沉铜孔偏差'
    ,mtinformation,[mbcancel],0);
    err:=true;
   end
  else
   if (trim(stringgrid1.Cells[4,i])='N') and
     (roundto(strtofloat(stringgrid1.Cells[6,i]),-2)<>
      roundto(dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+strtofloat(edit8.Text),-2)) then
    begin
     messagedlg('第'+inttostr(i)+'行钻咀:'+stringgrid1.Cells[3,i]+'不符非沉铜孔偏差'
     ,mtinformation,[mbcancel],0);
     err:=true;
    end;
 except

 end;
 
if not err then
  common.ShowMsg('钻咀检查通过!',1);
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
 PopupMenu6.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
 PopupMenu7.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  rkey25.Caption:=inttostr(Pinteger(Node.data)^);

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
 '压合靶矩表'+#13+
 'BOM'
 else
 listbox1.Items.Text:=
 '产品信息'+#13+
 '拼版设计'+#13+
 '全局参数'+#13+
 '工艺流程'+#13+
 '层压结构'+#13+
 '钻咀表'+#13+
 '备注信息'+#13+ 
 'BOM';
  ListBox1.ItemIndex:=0;
  ListBox1Click(nil);
end;

procedure TForm2.N10Click(Sender: TObject);
begin
try
 form_flowpara:=tform_flowpara.Create(application);
 dmcon.ads494.Filter:='step_number='+dmcon.ADS38STEP_NUMBER.AsString;
 form_flowpara.DBGrid1.ReadOnly:=true;
 form_flowpara.DBComboBox1.ReadOnly:=true;
 form_flowpara.DBComboBox1.Enabled:=false;
 form_flowpara.BitBtn1.Enabled:=false;
 form_flowpara.ShowModal;
finally
 form_flowpara.Free;
end;

end;

procedure TForm2.btnBOMClick(Sender: TObject);
begin
  dmcon.ADODataSet2.Close;
  dmcon.ADODataSet2.Parameters[0].Value := StrToInt(rkey25.Caption);
  dmcon.ADODataSet2.open;
  if dmcon.ADODataSet2.IsEmpty then
  begin
    ShowMsg('请先建立产品工艺流程,再编辑BOM',1);
    exit;
  end;
  frmBom_Edit := TfrmBom_Edit.Create(Application);
  try
    frmBom_Edit.Enter(enterMode,StrToInt(rkey25.Caption));
  finally
    frmBom_Edit.free;
    dmcon.aqBOMView.Close;
    dmcon.aqBOMView.Parameters[0].Value := StrToInt(rkey25.Caption);
    dmcon.aqBOMView.Open;
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

 stringgrid3.Cells[0,0]:='序号';
 stringgrid3.Cells[1,0]:='层次说明';
 stringgrid3.Cells[2,0]:='YAB';
 stringgrid3.Cells[3,0]:='XFB';
 stringgrid3.Cells[4,0]:='XFC';
 stringgrid3.Cells[5,0]:='XFG';
 stringgrid3.Cells[6,0]:='XEA';
 stringgrid3.Cells[7,0]:='XED';
 stringgrid3.Cells[8,0]:='备注信息';

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
  bitbtn9.Enabled:=false;
  bitbtn10.Enabled:=false;
  dbmemo2.ReadOnly:=true;
  dbmemo3.ReadOnly:=true;
  dbmemo4.ReadOnly:=true;

 if dmcon.FTag=0 then
   btnBOM.Enabled:=false
 else  if (dmcon.FTag=3) or (dmcon.FTag=5) then
 begin
    bitbtn5.Enabled:=false;
    bitbtn6.Enabled:=false;
    bitbtn7.Enabled:=false;
    bitbtn8.Enabled:=false;
    bitbtn16.Enabled:=false;
    bitbtn19.Enabled:=false;
    bitbtn24.Enabled:=false;

    dbedt1.Enabled:= (strtoint(vprev) = 2)  and dmcon.AQY0025MinRing.IsNull;
    btn7.Visible:= (strtoint(vprev) = 2) and dmcon.AQY0025MinRing.IsNull;

    stringgrid1.Options:=stringgrid1.Options+[gorowselect];
    stringgrid1.PopupMenu:=nil;
    Edit7.Enabled:=false;
    Edit8.Enabled:=false;

    Btnsave.Enabled:=false;
    N12.Enabled:=false;
 end;
 ListBox1Click(nil);
end;

procedure TForm2.N12Click(Sender: TObject);
var
  rKey:string;
begin
  rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
  dmcon.tmp.Close;
  dmcon.tmp.SQL.Text:='select COST_APPR_BY from data0025 where rkey ='+rKey;
  dmcon.tmp.Open;
  if dmcon.tmp.Fields[0].AsInteger>0 then
  begin
    ShowMsg('标准成本已审核,请先撤销标准成本审核,再补输制程参数!',1);
    exit;
  end;

  try
   form_flowpara:=tform_flowpara.Create(application);
   dmcon.ads494.Filter:='step_number='+dmcon.ADS38STEP_NUMBER.AsString;               
 //  form_flowpara.DBGrid1.ReadOnly:=false;
   form_flowpara.Frkey25:=rkey25.Caption;
   if form_flowpara.ShowModal=mrok then
   begin

   end;
  finally
   form_flowpara.Free;
  end;
end;

procedure TForm2.BitBtn16Click(Sender: TObject);
var
  i:integer;
  mytextfile:textfile;
  s:string;
  Hole_information_1:THole_information;
begin
  OpenDialog1.DefaultExt :='*.drl';
  OpenDialog1.Filter :='*.DRL|*.DRL';
  if OpenDialog1.Execute then
   begin
    if OpenDialog1.FileName <>'' then
     begin
      assignfile(mytextfile,OpenDialog1.FileName );
      reset(mytextfile);
       try
        Hole_information_1:=THole_information.Create; //建立类
        Hole_information_1.initialization_Result_Drill_Hole_information ;  //初使化类的数据
        while not eof(mytextfile) do
          begin
           Readln(mytextfile,s);
           //处理得到的字符串
           Hole_information_1.Drill_File_content:=s; //类得到字符串
           Hole_information_1.calculate; //处理函数
          end;
        finally
          i:=1;
         WHILE Hole_information_1.Result_Drill_Hole_information[i].Hole_Size>0 do
          begin
            Stringgrid1.RowCount :=Stringgrid1.RowCount+1;
            Stringgrid1.rows[Stringgrid1.rowcount-1].Text :='';
            Stringgrid1.Cells[0,Stringgrid1.RowCount-2]:=inttostr(i);
            Stringgrid1.Cells[1,Stringgrid1.RowCount-2]:=
            ansiuppercase(Hole_information_1.Result_Drill_Hole_information[i].Hole_denotation);

            if Hole_information_1.Result_Drill_Hole_information[i].Hole_Size_Unit='Inch' then
             Stringgrid1.Cells[3,Stringgrid1.RowCount-2]:=
              format('%.2f',[Hole_information_1.Result_Drill_Hole_information[i].Hole_Size*25.4])
            else
             Stringgrid1.Cells[3,Stringgrid1.RowCount-2]:=
              format('%.2f',[Hole_information_1.Result_Drill_Hole_information[i].Hole_Size]);

            Stringgrid1.Cells[6,Stringgrid1.RowCount-2]:=Stringgrid1.Cells[3,Stringgrid1.RowCount-2];
            Stringgrid1.Cells[7,Stringgrid1.RowCount-2]:=
                    inttostr(Hole_information_1.Result_Drill_Hole_information[i].Hole_Number);
            i:=i+1;
          end;
          closefile(mytextfile); //关闭文件
          Hole_information_1.Free; //取消类
        end;
     end else
     begin
       showmessage('没有选择文件.');
     end;
   end;

end;

procedure TForm2.BitBtn19Click(Sender: TObject);
var
 i:integer;
begin
  OpenDialog1.DefaultExt :='*.XLS';
  OpenDialog1.Filter :='*.XLS|*.XLS';
  if OpenDialog1.Execute then
  if messagedlg('导入新的钻孔表,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    for i:=1 to stringgrid1.RowCount-2 do  stringgrid1.Rows[i].Clear;
     stringgrid1.RowCount:=2;
    load_xls_to_sgrid(OpenDialog1.FileName,stringgrid1);
   end;

end;

procedure TForm2.BitBtn18Click(Sender: TObject);
begin
if stringgrid1.RowCount>2 then
 Export_Grid_to_Excel(STRINGGRID1,DBtext3.Caption,true);

end;

procedure TForm2.BitBtn24Click(Sender: TObject);
var
  str:string;
begin
 if (stringgrid1.RowCount > 2) and
    (not Msg_Dlg_Ask('粘贴新的钻孔表,原数据将丢失继续吗?','信息提示',1)) then
 else
  begin
    str:= Clipboard.AsText;
   if (copy(str,1,1) = #9) {and (copy(str,2,4) = '序号') } then
     Paste(str)
   else
     showmessage('粘贴板的内容不是所需的粘贴内容，请重新复制');
  end;

end;

procedure TForm2.MenuItem2Click(Sender: TObject);
var
pnla_pcs,pnlb_pcs,i,set_pcs:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
 set_pcs:=0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLB单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('JN') then //set单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  set_pcs := strtoint(dmcon.ads279PARAMETER_VALUE.Value);

for i:=1 to stringgrid1.RowCount-2 do
 try
  if pnla_pcs>0 then
   Stringgrid1.Cells[9,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,i]))*pnla_pcs+1);
  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,i]))*pnlb_pcs+1);

  if set_pcs > 0 then
   Stringgrid1.Cells[8,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,i]))*set_pcs);
 except

 end;

end;

procedure TForm2.MenuItem1Click(Sender: TObject);
var
pnla_pcs,pnlb_pcs,set_pcs:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
 set_pcs := 0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLB单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('JN') then //set单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  set_pcs := strtoint(dmcon.ads279PARAMETER_VALUE.Value);

 try
  if pnla_pcs>0 then
   Stringgrid1.Cells[9,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,Stringgrid1.row]))*pnla_pcs+1);
  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,Stringgrid1.row]))*pnlb_pcs+1);
  if set_pcs > 0 then
   Stringgrid1.Cells[8,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,Stringgrid1.row]))*set_pcs);

 except

 end;


end;

procedure TForm2.SET1Click(Sender: TObject);
var
 pnla_pcs,pnlb_pcs,set_pcs:integer;
begin
 pnla_pcs := 0;
 pnlb_pcs := 0;
 set_pcs := 0;
 if find_spec_rkey('3') then //PNLA单元数
  if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
   pnla_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

 if find_spec_rkey('4') then //PNLB单元数
  if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
   pnlb_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

 if find_spec_rkey('JN') then //set单元数
  if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
   set_pcs := strtoint(dmcon.ads279PARAMETER_VALUE.Value);

 try

  if set_pcs > 0 then
   Stringgrid1.Cells[7,Stringgrid1.row]:=
   inttostr(trunc(strtoint(trim(Stringgrid1.Cells[8,Stringgrid1.row]))/set_pcs));

  if pnla_pcs>0 then
   Stringgrid1.Cells[9,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,Stringgrid1.row]))*trunc(pnla_pcs/set_pcs)+1);

  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,Stringgrid1.row]))*trunc(pnlb_pcs/set_pcs)+1);
 except

 end;
end;

procedure TForm2.SET2Click(Sender: TObject);
var
 pnla_pcs,pnlb_pcs,i,set_pcs:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
 set_pcs:=0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLB单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dmcon.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('JN') then //set单元数
 if trim(dmcon.ads279PARAMETER_VALUE.Value)<>'' then
  set_pcs := strtoint(dmcon.ads279PARAMETER_VALUE.Value);

for i:=1 to stringgrid1.RowCount-2 do
 try
  if set_pcs > 0 then
   Stringgrid1.Cells[7,i]:=
   inttostr(trunc(strtoint(trim(Stringgrid1.Cells[8,i]))/set_pcs));

  if pnla_pcs>0 then
   Stringgrid1.Cells[9,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,i]))*trunc(pnla_pcs/set_pcs)+1);

  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,i]))*trunc(pnlb_pcs/set_pcs)+1);
 except

 end;
end;

procedure TForm2.N13Click(Sender: TObject);
var
 i,total_a,total_b,total_set:integer;
begin
 total_a := 0;
 total_b := 0;
 total_set := 0;
 if pos('TOTAL',UpperCase(stringgrid1.Cells[7,stringgrid1.RowCount-2]))>0 then
 if messagedlg('孔数已经汇总是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
  exit;

 try
 for i:=1 to stringgrid1.RowCount-2 do
  begin
   if trim(Stringgrid1.Cells[8,i])<>'' then
   total_set := total_set+strtoint(Stringgrid1.Cells[8,i]);

   if trim(Stringgrid1.Cells[9,i])<>'' then
   total_a := total_a+strtoint(Stringgrid1.Cells[9,i]);
   if trim(Stringgrid1.Cells[10,i])<>'' then
   total_b := total_b+strtoint(Stringgrid1.Cells[10,i]);
  end;
 except
  messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
  exit;
end;

end;

procedure TForm2.N14Click(Sender: TObject);
var
 i,total_a,total_b,total_set:integer;
begin
 form_drcalc:=tform_drcalc.Create(application);
 if form_drcalc.ShowModal=mrok then
  begin

   total_a:=0;
   total_b:=0;
   total_set:=0;

   try
    for i:=strtoint(form_drcalc.Edit1.text) to strtoint(form_drcalc.Edit2.text) do
    begin
     if trim(Stringgrid1.Cells[8,i])<>'' then
     total_set := total_set+strtoint(Stringgrid1.Cells[8,i]);

     if trim(Stringgrid1.Cells[9,i])<>'' then
     total_a := total_a+strtoint(Stringgrid1.Cells[9,i]);
     if trim(Stringgrid1.Cells[10,i])<>'' then
     total_b := total_b+strtoint(Stringgrid1.Cells[10,i]);

    end;
   except
    messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
    exit;
   end;

   stringgrid1.Cells[7,strtoint(form_drcalc.Edit2.text)+1]:='Total:';
   if total_set>0 then
    stringgrid1.Cells[8,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_set);

   if total_a>0 then
    stringgrid1.Cells[9,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_a);
   if total_b>0 then
    stringgrid1.Cells[10,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_b);

  end;
 form_drcalc.Free;


end;

procedure TForm2.Paste(var str: string);
var i,x,y,tmpx,tmpy:integer;
    FromCB1:array [0..255] of array[0..255] of string;
begin
    if str = '' then
    showmessage('粘贴板内容为空，请复制所需内容。')
    else begin
              i:=pos(#13,str);
              Delete(str,1,i+1);
              i:=pos(#13,str);
              x:=0;
              while i<>0 do
              begin
                  FromCB1[x][0]:= copy(str,1,i-1);
                  Delete(str,1,i+1);
                  Inc(x);
                  i:=pos(#13,str);
              end;
              FromCB1[x][0]:= str;
              stringgrid1.RowCount := x + 3;
              tmpx:=x;
              for x:= 0 to tmpx do
              begin
                      i:=pos(#9,FromCB1[x][0]);
                      y:=1;
                      while i<>0 do
                      begin
                          FromCB1[x][y]:= copy(FromCB1[x][0],1,i-1);
                          FromCB1[x][0]:= copy(FromCB1[x][0],i+1,length(FromCB1[x][0])-i);
                          Inc(y);
                          i:=pos(#9,FromCB1[x][0]);
                      end;
                          FromCB1[x][y]:= FromCB1[x][0];
              end;
              tmpx:= x;
              tmpy:= y;
              for x:=0 to tmpx do
              begin
                  for y:=1 to tmpy+1 do
                        stringgrid1.Cells[y-1,x+1]:=FromCB1[x][y+1];
              end;
        end;


end;

procedure TForm2.N6Click(Sender: TObject);
var i:word;
begin
  for i:=stringgrid1.RowCount-2 downto stringgrid1.Row do
  begin
   stringgrid1.Rows[i+1].Text:=stringgrid1.Rows[i].Text;
   stringgrid1.Cells[0,i+1]:=inttostr(i+1);
  end;
  stringgrid1.Rows[stringgrid1.Row].Text:='';
  stringgrid1.Cells[0,stringgrid1.Row]:= inttostr(stringgrid1.Row);
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
end;

procedure TForm2.N7Click(Sender: TObject);
var i:word;
begin
  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
   stringgrid1.Cells[0,i]:=inttostr(i);
  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TForm2.N18Click(Sender: TObject);
var i:integer;
begin
if messagedlg('删除全部钻孔信息,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  for i:=1 to stringgrid1.RowCount-2 do  stringgrid1.Rows[i].Clear;
   stringgrid1.RowCount:=2;
 end;

end;

procedure TForm2.N15Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid1.Rows[stringgrid1.row]);
 for i:=2 to StringGrid1.ColCount-1 do
 begin
  StringGrid1.Cells[i,stringgrid1.row]:=StringGrid1.Cells[i,stringgrid1.row-1];
  StringGrid1.Cells[i,stringgrid1.row-1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid1.row:=stringgrid1.row-1;


end;

procedure TForm2.N16Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid1.Rows[stringgrid1.row]);
 for i:=2 to StringGrid1.ColCount-1 do
 begin
  StringGrid1.Cells[i,stringgrid1.row]:=StringGrid1.Cells[i,stringgrid1.row+1];
  StringGrid1.Cells[i,stringgrid1.row+1]:=strow.Strings[i];
 end;   
 strow.Destroy;
 stringgrid1.row:=stringgrid1.row+1;
end;

procedure TForm2.N17Click(Sender: TObject);
var row:string;
    i:integer;
begin
 row:=inttostr(self.StringGrid1.row);
 row:=
 InputBox('信息输入', '请输入对调行数:      ',row);

 try
  if (strtoint(row)<=0) or (strtoint(row)>=stringgrid1.RowCount) then
   begin
    showmessage('输入行号有误');
    exit;
   end;
 except
  showmessage('输入格式有误');
  exit;
 end;

 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid1.Rows[stringgrid1.row]);
 for i:=2 to StringGrid1.ColCount-1 do
 begin
  StringGrid1.Cells[i,stringgrid1.row]:=StringGrid1.Cells[i,strtoint(row)];
  StringGrid1.Cells[i,strtoint(row)]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid1.row:=strtoint(row);
end;

function TForm2.get_drTrow(row: integer): string;
var
 i,t1:integer;
 t0:string;
begin
 if row <= 1 then
  result:='1'
 else
  for i:=row-1 downto 1 do
   if trim(stringgrid1.Cells[1,i])<>'' then
    begin
     t0:=copy(trim(stringgrid1.Cells[1,i]),2,length(trim(stringgrid1.Cells[1,i]))-1);
     try
      t1:=strtoint(t0)+1;
     except
      t1:=row;
     end;
     result:=inttostr(t1);
     break;
    end
   else
    if i=1 then
     result:='1'
    else
     result:=inttostr(row);
end;

function TForm2.isDriilChg: boolean;
var i:integer;
begin
  result:=false;
  FDrillChg:=false;
  with dmcon.tmp1 do
  begin
    close;
    sql.Text:='SELECT TOP 100 PERCENT SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
              'UNIT, PANEL_A, PANEL_B, REMARK,SET_UNMBER'+#13+
              'FROM dbo.Data0029'+#13+
              'where source_ptr='+dmcon.AQY0025RKEY.AsString+#13+
              'ORDER BY SEQ_NO';
    open;
    if RecordCount+2<>stringgrid1.RowCount then
    begin
      result:=true;
      FDrillChg:=true;
      exit;
    end;
    for i:=1 to RecordCount do
    begin
      if not
      ((stringgrid1.Cells[0,i]=inttostr(i)) and
      (stringgrid1.Cells[1,i]=trim(fieldbyname('SEQ_NR').AsString)) and  //'刀具';
      (stringgrid1.Cells[2,i]=trim(fieldbyname('MARK').AsString) ) and //'符号';
      (stringgrid1.Cells[3,i]=trim(fieldbyname('HOLES_DIA').AsString)) and //'成品孔径';
      (stringgrid1.Cells[4,i]=trim(fieldbyname('PTH').AsString)) and //'PTH';
      (stringgrid1.Cells[5,i]=trim(fieldbyname('TOLERANCE').AsString)) and//'公差';
      (stringgrid1.Cells[6,i]=trim(fieldbyname('DRILL_DIA').AsString)) and //'钻咀';
      (stringgrid1.Cells[7,i]=trim(fieldbyname('UNIT').AsString)) and//'PCS孔数';
      (stringgrid1.Cells[8,i]=trim(fieldbyname('SET_UNMBER').AsString)) and//'SET孔数';
      (stringgrid1.Cells[9,i]=trim(fieldbyname('PANEL_A').AsString)) and//'A板孔数';
      (stringgrid1.Cells[10,i]=trim(fieldbyname('PANEL_B').AsString)) and//'B板孔数';
      (stringgrid1.Cells[11,i]=trim(fieldbyname('REMARK').AsString))) then //'备注';
       begin
         result:=true;
         FDrillChg:=true;
         exit;
       end;
      next;
    end;
  end;
end;

function TForm2.isTargetChg:boolean;
var i:integer;
begin
  result:=false;
  FTargetChg:=false;
  with dmcon.tmp1 do
  begin
    close;
    sql.Text:='SELECT TOP 100 PERCENT LAYER_REMARK,YAB,XFB,XFC,'+#13+
              'XFG,XEA,XED,REMARK'+#13+
              'FROM dbo.Data0033'+#13+
              'where source_ptr='+dmcon.AQY0025RKEY.AsString+#13+
              'ORDER BY SEQ_NO';
    open;
    if RecordCount+2<>stringgrid3.RowCount then
    begin
      result:=true;
      FTargetChg:=true;
      exit;
    end;
    for i:=1 to RecordCount do
    begin
      if not
      ((stringgrid3.Cells[0,i]=inttostr(i)) and
      (stringgrid3.Cells[1,i]=trim(fieldbyname('LAYER_REMARK').AsString)) and  //'层次说明';
      (stringgrid3.Cells[2,i]=trim(fieldbyname('YAB').AsString) ) and //'YAB';
      (stringgrid3.Cells[3,i]=trim(fieldbyname('XFB').AsString)) and //'XFB';
      (stringgrid3.Cells[4,i]=trim(fieldbyname('XFC').AsString)) and //'XFC';
      (stringgrid3.Cells[5,i]=trim(fieldbyname('XFG').AsString)) and//'XFG';
      (stringgrid3.Cells[6,i]=trim(fieldbyname('XEA').AsString)) and //'XEA';
      (stringgrid3.Cells[7,i]=trim(fieldbyname('XED').AsString)) and//'XED';
      (stringgrid3.Cells[8,i]=trim(fieldbyname('REMARK').AsString))) then //'备注信息';
       begin
         result:=true;
         FTargetChg:=true;
         exit;
       end;
      next;
    end;
  end;
end;


procedure TForm2.N110Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[1,i])<>'' then
   stringgrid1.Cells[1,i] := hz_jiajian(stringgrid1.Cells[1,i],1);//加1

end;

procedure TForm2.N111Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[1,i])<>'' then
   stringgrid1.Cells[1,i] := hz_jiajian(stringgrid1.Cells[1,i],0);  //减1
end;

procedure TForm2.N39Click(Sender: TObject);
begin
frmpickengnote:=tfrmpickengnote.Create(application);
frmpickengnote.ADOQuery1.Close;
frmpickengnote.ADOQuery1.SQL.Text:=
'select * from data0036 where INST_CODE like ''dr%'' order by inst_code';
frmpickengnote.ADOQuery1.Open;
if frmpickengnote.ShowModal=mrok then
begin
 stringgrid1.Cells[11,stringgrid1.Row]:=
  frmpickengnote.ADOQuery1.fieldbyname('PROD_ROUT_INST').AsString;
end;
frmpickengnote.Free;
end;

function TForm2.hz_jiajian(str: string; jia_or_jian: byte): string;
begin
 result:=str;
if isnum(copy(str,length(str)-1,2)) then       //最后两位是数字
 if jia_or_jian=1 then
  result:=copy(str,1,length(str)-2)+
                       copy(inttostr(100+
                       strtoint(copy(str,length(str)-1,2)
                                )+1),
                            2,2)
 else
  result:=copy(str,1,length(str)-2)+
                       copy(inttostr(100+
                       strtoint(copy(str,length(str)-1,2)
                                )-1),
                            2,2)
else
 if isnum(copy(str,length(str),1)) then       //最后一位是数字
  if jia_or_jian=1 then
   result:=copy(str,1,length(str)-1)+
                         copy(inttostr(10+
                         strtoint(copy(str,length(str),1)
                                  )+1),
                              2,1)
  else
   result:=copy(str,1,length(str)-1)+
                         copy(inttostr(10+
                         strtoint(copy(str,length(str),1)
                                  )-1),
                              2,1);

end;

function TForm2.isnum(str: string): boolean;
var 
  i:integer;
begin
  for i:=1 to length(str) do
   if not (str[i] in ['0'..'9']) then
    begin
      result:=false;
      exit;
    end;
  result:=true;

end;

function TForm2.dr_jishuan(dr: single): single;
begin
  result:=round(dr*20)/20;
end;

procedure TForm2.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol=1) then
   begin
    ComboBox2.Left := Rect.Left+1;
    ComboBox2.Top := Rect.Top+2;
    ComboBox2.Width := Rect.Right - Rect.Left+3;
    ComboBox2.Height := Rect.Bottom - Rect.Top;
    ComboBox2.Visible := True;
    if StringGrid3.Cells[acol,arow]<>'' then
     combobox2.ItemIndex:=combobox2.Items.IndexOf(StringGrid3.Cells[acol,arow])
    else
     combobox2.ItemIndex:=-1;
   end
  else
    ComboBox2.Visible :=false;
 end;
end;

procedure TForm2.StringGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (KEY=13) and (Stringgrid3.row<stringgrid3.RowCount-1) then
  Stringgrid3.row:=Stringgrid3.row+1;
  if (chr(key)='D') and (ssCtrl in shift) and (stringgrid3.Row>1) then
  begin
  stringgrid3.Cells[stringgrid3.col,stringgrid3.row]:=
  stringgrid3.Cells[stringgrid3.col,stringgrid3.row-1];
  end;
end;

procedure TForm2.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
if StringGrid3.Col in [2,3,4,5,6,7] then
 begin
  if not (key in ['0'..'9','.',#8,#13]) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid3.Cells[StringGrid3.col,StringGrid3.row]) > 0  then abort;
 end;
end;

procedure TForm2.StringGrid3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid3.Row=stringgrid3.RowCount-1) and
   (trim(stringgrid3.Rows[stringgrid3.Row].Text)<>'') then
 begin
  stringgrid3.Cells[0,stringgrid3.Row]:=inttostr(stringgrid3.Row);
  stringgrid3.RowCount:=stringgrid3.RowCount+1;
  if not Btnsave.Enabled then Btnsave.Enabled:=true;
 end;
end;

procedure TForm2.get_target(rkey25:integer);
var i:integer;
begin
for i:=1 to stringgrid3.RowCount-2 do StringGrid3.Rows[i].Clear;
 with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:='select seq_no,source_ptr,layer_remark,YAB,XFB,'+
    'XFC, XFG, XEA, XED, remark from data0033 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
  stringgrid3.RowCount:=recordcount+2;
  for i:=1 to recordcount do
  begin
   stringgrid3.Cells[0,i]:=inttostr(i);
   stringgrid3.Cells[1,i]:=trim(fieldbyname('layer_remark').AsString);//层次说明
   stringgrid3.Cells[2,i]:=trim(fieldbyname('YAB').AsString);//YAB
   stringgrid3.Cells[3,i]:=trim(fieldbyname('XFB').AsString);//XFB
   stringgrid3.Cells[4,i]:=trim(fieldbyname('XFC').AsString);//XFC
   stringgrid3.Cells[5,i]:=trim(fieldbyname('XFG').AsString);//XFG
   stringgrid3.Cells[6,i]:=trim(fieldbyname('XEA').AsString);//XEA
   stringgrid3.Cells[7,i]:=trim(fieldbyname('XED').AsString);//XED
   stringgrid3.Cells[8,i]:=trim(fieldbyname('remark').AsString);//备注信息
   next;
  end;
  target:=True;
 end;
end;

procedure TForm2.update_target(rkey25:integer);
var i:integer;
begin
if find_33null then
begin
  with dmcon.ADOQuery1 do
  begin
   close;
   sql.Text:='delete from data0033 where source_ptr='+inttostr(rkey25);
   execsql;
  end;

with dmcon.ADOQuery1 do
 begin
  close;
  sql.Text:='select seq_no,source_ptr,layer_remark,YAB,XFB,'+
    'XFC,XFG,XEA,XED,remark from data0033 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
 end;

  for i:=1 to stringgrid3.RowCount-2 do
   dmcon.ADOQuery1.AppendRecord([i,
                              rkey25,
                              stringgrid3.Cells[1,i],
                              stringgrid3.Cells[2,i],
                              stringgrid3.Cells[3,i],
                              stringgrid3.Cells[4,i],
                              stringgrid3.Cells[5,i],
                              stringgrid3.Cells[6,i],
                              stringgrid3.Cells[7,i],
                              stringgrid3.Cells[8,i]]);

end;
end;

function TForm2.find_33null:boolean;
var i:integer;
begin
result:=true;
  if StringGrid3.RowCount>2 then
  begin
    for i:=1 to StringGrid3.RowCount-2 do
    begin
      if (trim(StringGrid3.Cells[2,i])='') or
         (trim(StringGrid3.Cells[3,i])='') or
         (trim(StringGrid3.Cells[4,i])='') or
         (trim(StringGrid3.Cells[5,i])='') or
         (trim(StringGrid3.Cells[6,i])='') then
      begin
        showmessage('压合靶矩表更新失败!有空值,请重新输入!');
        result:=false;
        break;
      end;
    end;
  end;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
stringgrid3.Cells[1,stringgrid3.Row]:=combobox2.Text;
end;

procedure TForm2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox2.DroppedDown:=true; //F1键出现下拉
if key=13 then stringgrid3.SetFocus;
end;

procedure TForm2.StringGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 IF ACOL=1 THEN
  stringgrid3.Options:=stringgrid3.Options-[goEditing]
 else
  stringgrid3.Options:=stringgrid3.Options+[goEditing];
end;

procedure TForm2.PopupMenu13Popup(Sender: TObject);
begin
if stringgrid3.Row = stringgrid3.RowCount-1 then
 begin
  MenuItem3.Enabled:=false;
  MenuItem6.Enabled:=false;
 end
else
 begin
  MenuItem3.Enabled:=true;
  MenuItem6.Enabled:=true;
 end;
 if stringgrid3.Row=1 then
  MenuItem5.Enabled:=false
 else
  MenuItem5.Enabled:=true;
 MenuItem4.Enabled:=stringgrid3.RowCount>2;
end;


procedure TForm2.MenuItem3Click(Sender: TObject);
var
  i:word;
begin
 for i:=stringgrid3.Row to stringgrid3.RowCount-2 do
  stringgrid3.Rows[i].Text:=stringgrid3.Rows[i+1].Text;
  stringgrid3.RowCount:=stringgrid3.RowCount-1;
if not Btnsave.Enabled then Btnsave.Enabled:=true;
end;


procedure TForm2.MenuItem4Click(Sender: TObject);
var i:integer;
begin
if messagedlg('删除全部压合靶矩信息,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  for i:=1 to stringgrid3.RowCount-2 do  stringgrid3.Rows[i].Clear;
   stringgrid3.RowCount:=2;
  if not Btnsave.Enabled then Btnsave.Enabled:=true;
 end;
end;

procedure TForm2.MenuItem5Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(StringGrid3.Rows[stringgrid3.row]);
 for i:=2 to StringGrid3.ColCount-1 do
 begin
  StringGrid3.Cells[i,stringgrid3.row]:=StringGrid3.Cells[i,stringgrid3.row-1];
  StringGrid3.Cells[i,stringgrid3.row-1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid3.row:=stringgrid3.row-1;
end;

procedure TForm2.MenuItem6Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid3.Rows[stringgrid3.row]);
 for i:=2 to StringGrid3.ColCount-1 do
 begin
  StringGrid3.Cells[i,stringgrid3.row]:=StringGrid3.Cells[i,stringgrid3.row+1];
  StringGrid3.Cells[i,stringgrid3.row+1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid3.row:=stringgrid3.row+1;
end;

procedure TForm2.btn7Click(Sender: TObject);
begin
  if dmcon.AQY0025MinRing.AsString ='' then exit;
  dmcon.tmp.Close;
  dmcon.Tmp.SQL.Text:= 'UPDATE DATA0025 SET MinRing = '+ dmcon.AQY0025MinRing.AsString + ' where rkey = '+ rkey25.Caption;
  dmcon.Tmp.ExecSQL;


  if dmcon.FTag = 5 then
  begin
    btn7.Visible:= False;
    dbedt1.Enabled:= False;
  end;
end;

end.
