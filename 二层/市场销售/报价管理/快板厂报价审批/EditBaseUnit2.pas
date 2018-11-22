unit EditBaseUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseUnit1, StdCtrls, Buttons, ComCtrls, ToolWin, ExtCtrls,
  DBCtrls, Mask, Grids, DBGridEh, DB, ADODB,DateUtils,raFunc,Qt ,math,
  Menus

;

const
  //定义的278的RKEYSPACE值
  Myspecrkey001 = 'SS'  ; //用来表示总面积的参数,面积为交货面积：如报价单位为PCS由为PCS的平方米，SET则为交货单位的平方米
  Myspecrkey002 = 'F';//交货长  //'SL'  为字符型，要数字型的
  Myspecrkey003 = 'G';//交货宽  //'SW'  为字符型，要数据型的

  RATEMMTOM5 = 1000000 ; //平方毫米到平方米的转换比率
type

  TEditBaseForm2 = class(TBaseForm1)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Edit1: TMaskEdit;
    Label20: TLabel;
    Edit9: TEdit;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    BitBtn6: TBitBtn;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Edit18: TEdit;
    Label54: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker4: TDateTimePicker;
    Label22: TLabel;
    Label9: TLabel;
    Edit13: TEdit;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label55: TLabel;
    Edit16: TEdit;
    BitBtn20: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label61: TLabel;
    Edit19: TEdit;
    Label19: TLabel;
    DBMemo2: TDBMemo;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Panel2: TPanel;
    Label51: TLabel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    BitBtn8: TBitBtn;
    DBComboBox1: TDBComboBox;
    Splitter1: TSplitter;
    ADOStoredProc1: TADOStoredProc;
    DBGridEh2: TDBGridEh;
    Label24: TLabel;
    ADOQuery1: TADOQuery;
    Label25: TLabel;
    MaskEdit2: TMaskEdit;
    Label26: TLabel;
    MaskEdit3: TMaskEdit;
    Label27: TLabel;
    MaskEdit4: TMaskEdit;
    Label8: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label18: TLabel;
    Label21: TLabel;
    ComboBox4: TComboBox;
    Label23: TLabel;
    ComboBox5: TComboBox;
    Button1: TButton;
    ComboBox6: TComboBox;
    qwzpr85_10: TADOStoredProc;
    qwzpr85_10RKEY: TAutoIncField;
    qwzpr85_10QTE_PTR: TIntegerField;
    qwzpr85_10UNIT_PTR: TIntegerField;
    qwzpr85_10UNIT_VALUE: TStringField;
    DataSource85_10: TDataSource;
    qwzpr85_10MyPARAMETER_NAME: TStringField;
    qwzpr85_10MyPARAMETER_DESC: TStringField;
    qwzpr85_10MyDATA_TYPE: TSmallintField;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    StringGrid1: TStringGrid;
    BitBtn14: TBitBtn;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Edit11: TEdit;
    Label31: TLabel;
    ADOQuery2: TADOQuery;
    Edit14: TEdit;
    Label58: TLabel;
    ComboBox11: TComboBox;
    Label57: TLabel;
    ComboBox7: TComboBox;
    Label32: TLabel;
    Label33: TLabel;
    Edit12: TEdit;
    Label34: TLabel;
    ComboBox8: TComboBox;
    Panel4: TPanel;
    StringGrid2: TStringGrid;
    Panel5: TPanel;
    Label7: TLabel;
    ComboBox9: TComboBox;
    Edit15: TEdit;
    Edit17: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    ComboBox10: TComboBox;
    Label38: TLabel;
    BitBtn15: TBitBtn;
    qwzpr85_10MyDataType: TStringField;
    PopupMenu1: TPopupMenu;
    MyPopupN1: TMenuItem;
    MyPopupN2: TMenuItem;
    qwzpr85_10MyUnit: TStringField;
    qwzpr85_10Unit_ptr0002: TIntegerField;
    ComboBox12: TEdit;
    Edit20: TEdit;
    Label39: TLabel;
    TabSheet6: TTabSheet;
    DBGridEh3: TDBGridEh;
    DataSource85_33: TDataSource;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn16: TBitBtn;
    ComboBox13: TComboBox;
    StringGrid3: TStringGrid;
    ADOQuery3: TADOQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
                                      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
                               Shift: TShiftState);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
                                 Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6MouseDown(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit18Change(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure DBMemo2Change(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure DBGridEh2CellClick(Column: TColumnEh);
    procedure MaskEdit2Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure qwzpr85_10AfterScroll(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DataSource85_10DataChange(Sender: TObject; Field: TField);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure qwzpr85_10BeforeEdit(DataSet: TDataSet);

    procedure BitBtn14Click(Sender: TObject);

    procedure BitBtn9Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
                                      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormPaint(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
                                    var CanSelect: Boolean);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Exit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure qwzpr85_10CalcFields(DataSet: TDataSet);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure MyPopupN1Click(Sender: TObject);
    procedure MyPopupN2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure ComboBox13Change(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
  private
    { Private declarations }
    vEditMode : integer;
    vdata0050rkey : integer;

    vPROD_ROUTE_PTR:integer;
    vedit20Text : string;

    AreaRkey,AreaRkey2,AreaRkey3:integer;//面积参数的RKEY值

    vsave0085,vsave01:boolean;

    sumares :single ; //根据输入的长宽个数计算出面积,平方毫米

    vRkeyData0085,ENGR_ROUTE_PTR0085:integer;

    summat :single;//总材料价格
    basepriceptr : integer ;//基本价格
    ComboBox6Text2:string;

    function checkNumber2(const value:string ; const Key: Char):boolean;overload;
    function checkNumber2(const Key: Char):boolean;overload;
    function Get_EditMode: integer;
    procedure Set_EditMode(const Value: integer);

    function DisplayData00351(CONST VALUE:INTEGER):boolean;
    //处理参数,增加删除参数
    function AddQwzpr85_10(CONST VALUE :INTEGER):boolean ;
    function DeleteQwzpr85_10(CONST VALUE :INTEGER;const value2:boolean):boolean ;
    //处理费用类别
    function AddQwzpr85_23():boolean ;
    function DeleteQwzpr85_23():boolean ;
    //显示特别费用中的项目
    function ShowComboBox2_5(var sender:TComboBox;num:string):boolean ;
    //用户更改了特别费用中的项目
    function ChangeComboBox2_5(var sender:TComboBox;num:string):boolean ;

    //
    function ClackFORMULA(const value:string):string ;
    //在S中查找 sub1,如果存在就替换为 sub2

    function repl_substr(sub1, sub2:string;var  s: string ): string ;

    function repl_substr2(var s: string): string ;

    //处理参数值
    function ProcesPARAMETERvalue():boolean ;
    //处理参数
    function ProcesPARAMETER(var s: string):boolean ;
    //处理表单
    function ProcesTable(var s: string):boolean ;
    //处理IF函数
    function ProcesIf(var s: string):boolean ;
    function ProcesIf0(const value:string;var s: string):boolean ;
    //查找相对应的右括号
    function FindRight2(const s:string):integer;


    function CluckAREA():BOOLEAN;

    function DisplyDatadata0432():boolean;
    procedure displaycheck5;
    function ShowComboBox2_5check(var sender: TComboBox;
                                  num: string): boolean;
    function DisplayData00351check(const VALUE: INTEGER): boolean;
    function AddQwzpr85_10check(const VALUE: INTEGER): boolean;
    function DisplyDatadata0432check: boolean;
    function Get_RkeyData0085: integer;
    procedure Set_RkeyData0085(const Value: integer);
    procedure addQNumber_1(const VALUE: INTEGER);
    procedure update_04(v_seed: string);
    //显示基价
    function ShowComboBox13(var sender:TComboBox;num:string):boolean ;
    //用户更改基价中的项目
    function ChangeComboBox13(var sender:TComboBox):boolean ;
    //计算内容
    function ExceptFORMULA22(const s1: string; const Pcentsv: integer;
                       var value: single): boolean;

  public
    { Public declarations }
    user_ptrs:string;
    //表示编辑方式,0新增1编辑2查看
    vvmode:integer;
    property EditMode:integer read Get_EditMode write Set_EditMode;
    property RkeyData0085:integer read Get_RkeyData0085 write Set_RkeyData0085;
  end;

var
  EditBaseForm2: TEditBaseForm2 ;

implementation

uses
    TFormulaUnit2,
    DMUnit1,CalculUnit2,FindDATA0050Unit2,EditCustUnit2,FindData0008Unit2
    ,PrintUnit2
    ,FindData0006Unit2
    ,FindData0348Unit2
    ,FindMatPriceUnit2 ;
{$R *.dfm}

procedure TEditBaseForm2.BitBtn3Click(Sender: TObject);
begin  //退出
  inherited ;

  if vEditMode <> 3 then
      begin
          //改变数据时，提示是不是要保存数据
          if BitBtn2.Enabled then
              begin
                  if messagedlg('是不是要保存该项报价档案的更改吗？',mtconfirmation,[mbYes,mbNo],0) = MrYes then
                      begin
                           BitBtn2Click(sender) ;
                           modalresult:=mrOK	;
                      end
                  else
                     begin
                               if dm.qwzpr85_1.State in [dsEdit, dsInsert] then
                                   dm.qwzpr85_1.CancelUpdates ;
                               if dm.qwzpr85_23.State in [dsEdit, dsInsert] then
                                   dm.qwzpr85_23.CancelUpdates ;
                               if qwzpr85_10.State in [dsEdit, dsInsert] then
                                   qwzpr85_10.CancelUpdates ;

                          modalresult:=mrCancel	;
                     end ;
                  modalresult:=mrCancel	;
              end
          else
              begin
                  if dm.qwzpr85_1.State in [dsEdit, dsInsert] then
                      dm.qwzpr85_1.CancelUpdates ;
                  if dm.qwzpr85_23.State in [dsEdit, dsInsert] then
                      dm.qwzpr85_23.CancelUpdates ;
                  if qwzpr85_10.State in [dsEdit, dsInsert] then
                      qwzpr85_10.CancelUpdates ;

                  modalresult:=mrCancel	;
              end ;
      end
  else
      modalresult:=mrCancel	;


end;

procedure TEditBaseForm2.DBGridEh1DrawColumnCell(Sender: TObject;
                                                 const Rect: TRect; DataCol: Integer; Column: TColumnEh;
                                                 State: TGridDrawState);
begin
  inherited;
 if (gdFocused in State) then
     begin
         if (column.FieldName = DBComboBox1.DataField ) then
             begin
                 DBComboBox1.Left := DBGridEh1.left + Rect.Left + 1 ;
                 DBComboBox1.Top := DBGridEh1.Top + Rect.Top ;
                 DBComboBox1.Width := Rect.Right - Rect.Left + 3 ;
                 DBComboBox1.Height := Rect.Bottom - Rect.Top ;
             end;
     end;

   if not (gdFixed in State) then
       DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);

end;

procedure TEditBaseForm2.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
VAR
  NI2:INTEGER;
begin
  inherited;
  {if vsave01 then
      BitBtn2.Enabled := true ;
  {}
  {IF DBGridEh1.DataSource.DataSet.IsEmpty THEN
      Abort
  ELSE
      BEGIN
          //SHOWMESSAGE((ActiveControl.Name ));
          SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
      END ; {}
  //showmessage(self.qwzpr85_10MyDATA_TYPE.AsString );
  IF NOT (( Key = CHAR(Key_Tab) ) or ( Key = CHAR(Key_Return) ) or ( Key = #13 )or ( Key = #8 ))	THEN
  begin
      if DBGridEh1.SelectedField.FieldName ='UNIT_VALUE' then
          BEGIN
              //SHOWMESSAGE(self.qwzpr85_10unit_ptr.AsString );
              IF NOT (self.qwzpr85_10unit_ptr.IsNull) THEN
                  BEGIN
                      NI2 := self.qwzpr85_10unit_ptr.Value ;
                      if (NI2 = AreaRkey)
                          OR (NI2 =AreaRkey2)
                          OR (NI2 =AreaRkey3) then
                          begin
                               Key := #0 ;
                               showmessage('此参数不能编辑！！！');
                               exit;
                          end ;
                  END ;
          END ;
      if DBGridEh1.SelectedField.FieldName ='UNIT_VALUE' then
          if self.qwzpr85_10MyDATA_TYPE.Value = 1 then
              begin
                   //if not (key in ['0'..'9','.',#8]) then
                   if not ( (key = '0')
                           or (key = '1')
                           or (key = '2')
                           or (key = '3')
                           or (key = '4')
                           or (key = '5')
                           or (key = '6')
                           or (key = '7')
                           or (key = '8')
                           or (key = '9')
                           or (key = '.')
                           or (key = #8)
                           or (key = #0)
                           ) then
                           //..'9','.',#8]) then
                      begin
                           Key := #0 ;
                           showmessage('此行不允许输入字符,只允许输入数字与一个小数点');
                      end
                   else
                      begin
                            if vsave01 then BitBtn8.Enabled := true ;
                      end ;
              end
          else
              begin
                  if vsave01 then BitBtn8.Enabled := true ;
              end ;
  end;
end;

procedure TEditBaseForm2.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState) ;
begin
  inherited ;
  //
  {
  if (key=46) and (ssctrl in shift) then
      begin
          abort ;
          exit ;
      end;
  {}
end;

procedure TEditBaseForm2.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {IF KEY = 13 THEN
      begin
          DBGridEh1.SetFocus ;
          //ADOData0431.Next;
      end;
  {}
end;

procedure TEditBaseForm2.FormShow(Sender: TObject);
var
  i,i2:integer;
  //tm2:TComponent;
begin
  inherited;
  StringGrid3.Cells[1,0] := '材料编码';
  StringGrid3.Cells[2,0] := '材料描述';
  StringGrid3.Cells[3,0] := '单价';

  StringGrid3.ColWidths[0] := 0;
  StringGrid3.ColWidths[1] := 100;
  StringGrid3.ColWidths[2] := 100;
  StringGrid3.ColWidths[3] := 100;
  StringGrid3.ColWidths[4] := 0;
  
  DBGridEh1.Columns[4].Width := DBGridEh1.Width
                                  - DBGridEh1.Columns[0].Width
                                  - DBGridEh1.Columns[1].Width
                                  - DBGridEh1.Columns[2].Width
                                  - DBGridEh1.Columns[3].Width
                                  - 40 ;
  DBGridEh2.Columns[0].Width := DBGridEh2.Width
                                 // - DBGridEh2.Columns[1].Width
                                  - 40 ;
  if vRkeyData0085 = 0 then  //新增记录
        addQNumber_1(vvmode);//新增记录



  if not dm.qwzpr85_1PROD_ROUTE_PTR.IsNull then
      begin
          vPROD_ROUTE_PTR := dm.qwzpr85_1PROD_ROUTE_PTR.Value ;
          with ADOQuery1 do
               begin
                   if Active then Close;
                   SQL.Clear ;
                   SQL.Add('select QTE_APPROV_DESC from data0264 where rkey = '''+inttostr(vPROD_ROUTE_PTR)+'''');
                   Prepared ;
                   //SHOWMESSAGE(SQL.Text );
                   Open ;
                   IF NOT IsEmpty THEN
                       begin
                           ComboBox12.Text := FieldValues['QTE_APPROV_DESC'] ;
                           //ComboBox12.Items.Clear ;
                           //ComboBox12.Items.Add(FieldValues['QTE_APPROV_DESC']);
                           //ComboBox12.ItemIndex := 0 ;
                       end
                   ELSE
                       AreaRkey := 0 ;
                   CLOSE ;
               end ;

      end ;

  with ADOQuery1 do
     begin
         if Active then Close;
         SQL.Clear ;
         SQL.Add('select RKEY from data0278 where spec_rkey='''+Myspecrkey001+'''');
         Prepared ;
         //SHOWMESSAGE(SQL.Text );
         Open ;
         IF NOT IsEmpty THEN
             AreaRkey := FieldValues['RKEY']
         ELSE
             AreaRkey := 0 ;
         CLOSE ;
     end ;
    with ADOQuery1 do
         begin
             if Active then Close;
             SQL.Clear ;
             SQL.Add('select RKEY from data0278 where spec_rkey='''+Myspecrkey002+'''');
             Prepared ;
             //SHOWMESSAGE(SQL.Text );
             Open ;
             IF NOT IsEmpty THEN
                 AreaRkey2 := FieldValues['RKEY']
             ELSE
                 AreaRkey2 := 0 ;
             CLOSE ;
         end ;
    with ADOQuery1 do
         begin
             if Active then Close;
             SQL.Clear ;
             SQL.Add('select RKEY from data0278 where spec_rkey='''+Myspecrkey003+'''');
             Prepared ;
             //SHOWMESSAGE(SQL.Text );
             Open ;
             IF NOT IsEmpty THEN
                 AreaRkey3 := FieldValues['RKEY']
             ELSE
                 AreaRkey3 := 0 ;
             CLOSE ;
         end ;
  //SHOWMESSAGE(INTTOSTR(AreaRkey));

  StringGrid2.Cells[0,0] := ' 项目 ' ;
  StringGrid2.Cells[1,0] := ' 金额 ' ;

  StringGrid2.ColWidths[2] := 0 ;
  sumares := 0 ;

  if vEditMode = 0  then  //新增
      vsave0085 := true
  else if (vEditMode = 1) or (vEditMode = 2) or (vEditMode = 3) then   //1编辑,2检查
      vsave0085 := false ;

  dm.PEditDATA0351 := false ;
  self.KeyPreview := true ;
  if vEditMode = 3 then
     displaycheck5()
  else
  begin
      if dm.qwzpr85_1ENGR_ROUTE_PTR.IsNull then
          ENGR_ROUTE_PTR0085 := -1
      else
          ENGR_ROUTE_PTR0085 :=  dm.qwzpr85_1ENGR_ROUTE_PTR.Value ;
      //显示表85的内容
      edit1.Text := dm.qwzpr85_1TNUMBER.Value ;
      MaskEdit2.Text := dm.qwzpr85_1UNIT_LEN.AsString ; //交货长
      MaskEdit3.Text := dm.qwzpr85_1UNIT_WTH.AsString ; //交货宽
      MaskEdit4.Text := dm.qwzpr85_1qte_units.AsString ; //交货数量

      if not dm.qwzpr85_1BASE_PRICE.IsNull then
          edit20.Text := dm.qwzpr85_1BASE_PRICE.AsString ;
      if not dm.qwzpr85_1BasePricePtr.IsNull then
          basepriceptr := dm.qwzpr85_1BasePricePtr.Value ;
          
      Edit9.Text := dm.qwzpr85_1cust_rfq.AsString ;//参考号:
      Edit18.Text := dm.qwzpr85_1cust_part_no.AsString ;//客户型号:
      if not dm.qwzpr85_1ttype2.IsNull then  //报价类型:
           ComboBox1.ItemIndex := dm.qwzpr85_1ttype2.AsInteger ;
      //新增显示特别材料
      if dm.qwzpr85_33.Active then dm.qwzpr85_33.Close ;
      dm.qwzpr85_33.Parameters.ParamValues['@rkey0085'] := dm.qwzpr85_1rkey.Value ;
      dm.qwzpr85_33.Prepared ;
      i2 := 1;
      dm.qwzpr85_33.Open ;
      if not dm.qwzpr85_33.IsEmpty then
           begin
                StringGrid3.RowCount := StringGrid3.RowCount + dm.qwzpr85_33.RecordCount ;
                while not dm.qwzpr85_33.Eof do
                    begin
                         StringGrid3.Cells[0,i2] := dm.qwzpr85_33D0028_PTR.AsString ;
                         StringGrid3.Cells[3,i2] := dm.qwzpr85_33price.AsString ;
                         if dm.qwzpr85_34.Active then dm.qwzpr85_34.Close ;
                         dm.qwzpr85_34.Parameters.ParamValues['@rkey0017'] := dm.qwzpr85_33STD_INVENT_PTR.Value ;
                         dm.qwzpr85_34.Prepared ;
                         dm.qwzpr85_34.Open ;
                         if not(dm.qwzpr85_34.IsEmpty) then
                              begin
                                  StringGrid3.Cells[1,i2] := dm.qwzpr85_34INV_PART_NUMBER.Value ;
                                  StringGrid3.Cells[2,i2] := dm.qwzpr85_34INV_PART_DESCRIPTION.Value ;
                              end ;
                         dm.qwzpr85_34.Close;


                         i2 := i2 +1;
                         dm.qwzpr85_33.Next ;
                    end ;

           end ;


      if vEditMode = 0 then
           begin
              DateTimePicker1.Date  := EncodeDate(YearOf(now()),MonthOf(now()),DayOf(now())); ;  //报价日期:
              IF MonthOf(now()) <> 12 THEN
                  DateTimePicker3.Date  := EncodeDate(YearOf(now()),MonthOf(now())+1,DayOf(now()))
              ELSE
                  DateTimePicker3.Date  := EncodeDate(YearOf(now())+1,1,DayOf(now())) ;
           end
      else if (vEditMode = 1) or (vEditMode = 2) then
           begin
              DateTimePicker1.DateTime := dm.qwzpr85_1qte_date.AsDateTime  ;
              DateTimePicker3.DateTime := dm.qwzpr85_1expiration_date.AsDateTime ;
           end ;

      ComboBox11.ItemIndex :=  dm.qwzpr85_1qte_unit_ptr.Value - 1 ;
      Label37.Caption := '  ' +  ComboBox11.Text + ' ' ;
      if dm.qwzpr85_1qte_unit_ptr.IsNull then ComboBox11.ItemIndex := 0;

      edit14.Text  :=  dm.qwzpr85_1tunits.AsString ;
      if dm.qwzpr85_1tunits.IsNull then edit14.Text := '1' ;
      if edit14.Text ='0' then edit14.Text := '1' ;
      //Edit2.Text := dm.qwzpr85_1
      Edit2.Text := dm.qwzpr85_1cust_name.AsString ;//客户:
      Edit10.Text := dm.qwzpr85_1cust_contact.AsString ;//联络人:
      Edit3.Text := dm.qwzpr85_1cust_phone.AsString ;//电话号码:
      //Edit5.Text := dm.qwzpr85_1 ;//销售代表:
      //Edit6.Text := dm.qwzpr85_1 ;//币种:
      Edit4.Text := dm.qwzpr85_1payment.AsString ;//结算方式:
      Edit7.Text := dm.qwzpr85_1cust_fax.AsString ;//传真:
      Edit8.Text := dm.qwzpr85_1EMAIL.AsString ;//E-mail:
      if not  dm.qwzpr85_1QuoteType.IsNull then
          ComboBox9.ItemIndex := dm.qwzpr85_1QuoteType.AsInteger ;


      if not dm.qwzpr85_1srep_PTR.IsNull then
         with ADOQuery1 do
             begin
                 if Active then Close;
                 SQL.Clear ;
                 SQL.Add('SELECT Data0009.SALES_REP_NAME'
                       +' FROM Data0009 '
                       +' where  Data0009.RKEY ='''+dm.qwzpr85_1srep_PTR.AsString+'''');
                 Prepared ;
                 //SHOWMESSAGE(SQL.Text );
                 Open ;
                 IF NOT IsEmpty THEN
                     edit5.Text := FieldValues['SALES_REP_NAME'];
                 CLOSE ;
             end ;

     if not dm.qwzpr85_1curr_PTR.IsNull then
         with ADOQuery1 do
             begin
                 if Active then Close;
                 SQL.Clear ;
                 SQL.Add('select CURR_NAME from data0001 where rkey  ='''+dm.qwzpr85_1curr_PTR.AsString+'''');
                 Prepared ;
                 //SHOWMESSAGE(SQL.Text );
                 Open ;
                 IF NOT IsEmpty THEN
                     edit6.Text := FieldValues['CURR_NAME'];
                 CLOSE ;
             end ;


      if not dm.qwzpr85_1prod_code_ptr.IsNull then
         with ADOQuery1 do
             begin
                 if Active then Close;
                 SQL.Clear ;
                 SQL.Add('select PRODUCT_NAME from data0008 where rkey  ='''+dm.qwzpr85_1prod_code_ptr.AsString+'''');
                 Prepared ;
                 //SHOWMESSAGE(SQL.Text );
                 Open ;
                 IF NOT IsEmpty THEN
                     edit16.Text := FieldValues['PRODUCT_NAME'];
                 CLOSE ;
             end ;

      if not dm.qwzpr85_1cust_ptr.IsNull then
          begin
              with ADOQuery1 do
                   begin
                       if Active then Close;
                       SQL.Clear ;
                       SQL.Add('SELECT DISTINCT Data0189.STATE_TAX'
                                +' FROM Data0012 INNER JOIN'
                                      +' Data0189 ON Data0012.SHIP_CTAX_PTR = Data0189.RKEY'
                                +' WHERE Data0012.CUSTOMER_PTR = '+dm.qwzpr85_1cust_ptr.AsString);
                       Prepared ;
                       //SHOWMESSAGE(SQL.Text );
                       Open ;
                       ComboBox7.Clear ;
                       IF NOT IsEmpty THEN
                           begin
                               while not eof do
                                   begin
                                       ComboBox7.Items.Add(floattostr(FieldValues['STATE_TAX']));
                                       next;
                                   end ;
                           end
                       else
                           begin
                               //ComboBox7.Items.Add('0');
                           end ;
                       CLOSE ;
                   end ;
          end
      else
          begin
               ComboBox7.Clear ;
               //ComboBox7.Items.Add('0');
               //ComboBox7.text := '0';
          end ;
      if not dm.qwzpr85_1vatax.IsNull then
          begin
              ComboBox7.text := dm.qwzpr85_1vatax.AsString ;
          end
      else
          ComboBox7.text := '0' ;




      if dm.qwzpr85_8.Active then dm.qwzpr85_8.Close ;
      if qwzpr85_10.Active then qwzpr85_10.Close ;
      if dm.qwzpr85_23.Active then dm.qwzpr85_23.Close ;

      //if vEditMode = 0 then
          begin
               //显示特别费用
               if not dm.qwzpr85_12.Active then dm.qwzpr85_12.Open ;
               dm.qwzpr85_12.First ;
               while not dm.qwzpr85_12.Eof do
                   begin
                        //ComboBox1.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                        ComboBox2.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                        ComboBox3.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                        ComboBox4.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                        ComboBox5.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                        ComboBox13.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                        dm.qwzpr85_12.Next ;
                   end ;
               //处理要显示的特别费用
               if not (dm.qwzpr85_23.Active) then
                   begin
                       dm.qwzpr85_23.Parameters.ParamValues['@rkey085'] :=  vRkeyData0085;//dm.qwzpr85_1RKEY.Value ;
                       dm.qwzpr85_23.Open ;
                   end ;
               ShowComboBox2_5(ComboBox2,'1') ;
               ShowComboBox2_5(ComboBox3,'2') ;
               ShowComboBox2_5(ComboBox4,'3') ;
               ShowComboBox2_5(ComboBox5,'4') ;
               //显示基本价格
               if not dm.qwzpr85_1BasePricePtr.IsNull then
                   ShowComboBox13(ComboBox13,dm.qwzpr85_1BasePricePtr.asstring);

               //显示报价产品类别
               if not (dm.qwzpr85_22.Active) then dm.qwzpr85_22.open ;
               dm.qwzpr85_22.First ;
               while not dm.qwzpr85_22.Eof do
                   begin
                        ComboBox6.Items.Add(dm.qwzpr85_22row_name.Value);
                        dm.qwzpr85_22.Next ;
                   end ;

               {if dm.qwzpr85_21.Active then dm.qwzpr85_21.Close ;
               dm.qwzpr85_21.Parameters.ParamValues['@rkey085'] := vRkeyData0085;// dm.qwzpr85_1RKEY.Value ;
               dm.qwzpr85_21.Prepared ;
               dm.qwzpr85_21.Open ;
               {}
               if not dm.qwzpr85_1ENGR_ROUTE_PTR.IsNull then
                   if dm.qwzpr85_22.Locate('rkey',dm.qwzpr85_1ENGR_ROUTE_PTR.Value,[]) then
                       begin
                           //showmessage(dm.qwzpr85_22row_name.Value);
                           for i := 0 to ComboBox6.Items.Count - 1 do
                               if  ComboBox6.Items[i] = dm.qwzpr85_22row_name.Value then
                                   begin
                                       ComboBox6.ItemIndex := i;
                                       break ;
                                   end;

                           //ComboBox6.Text := dm.qwzpr85_22row_name.Value ;
                           //showmessage(ComboBox6.Text);
                           //显示特别工艺
                           DisplayData00351(vEditMode) ;

                       end ;
          end ;
      dm.PEditDATA0351 := true ;


      StringGrid1.Cells[0,0] := '项目' ;
      StringGrid1.Cells[1,0] := '计算参考值' ;
      StringGrid1.Cells[2,0] := '实际收取' ;

      //

      IF DM.qwzpr85_23.Locate('TYPEMARK',1,[]) THEN
          BEGIN
               StringGrid1.Cells[0,1] := ' 工程费 ' ;
               StringGrid1.Cells[1,1] := DM.qwzpr85_23free_amount.AsString ;
               StringGrid1.Cells[2,1] := DM.qwzpr85_23amount.AsString ;
          END ;
      IF DM.qwzpr85_23.Locate('TYPEMARK',2,[]) THEN
          BEGIN
               StringGrid1.Cells[0,2] := ' 制板费 ' ;
               StringGrid1.Cells[1,2] := DM.qwzpr85_23free_amount.AsString ;
               StringGrid1.Cells[2,2] := DM.qwzpr85_23amount.AsString ;
          END ;
      IF DM.qwzpr85_23.Locate('TYPEMARK',3,[]) THEN
          BEGIN
               StringGrid1.Cells[0,3] := ' 菲林费 ' ;
               StringGrid1.Cells[1,3] := DM.qwzpr85_23free_amount.AsString ;
               StringGrid1.Cells[2,3] := DM.qwzpr85_23amount.AsString ;
          END ;
      IF DM.qwzpr85_23.Locate('TYPEMARK',4,[]) THEN
          BEGIN
               StringGrid1.Cells[0,4] := ' 测试费 ' ;
               StringGrid1.Cells[1,4] := DM.qwzpr85_23free_amount.AsString ;
               StringGrid1.Cells[2,4] := DM.qwzpr85_23amount.AsString ;
          END ;
      CluckAREA() ;
      //显示最后的结果
      DisplyDatadata0432 ;

      vsave01 := true ;

      if vEditMode = 2 then
          begin //将控件的属性改为不可编辑

               for i := 0 to ComponentCount - 1 do
                   begin
                       //tm2 := Components[i];
                       if (Components[i].Name <> 'BitBtn3') and (Components[i].Name <> 'BitBtn9') then
                           begin
                                if Components[i] is Tedit then
                                     (Components[i] as Tedit).Enabled := false
                                else if Components[i] is Tmaskedit then
                                     (Components[i] as Tmaskedit).Enabled := false
                                else if Components[i] is TComboBox then
                                     (Components[i] as TComboBox).Enabled := false
                                else if Components[i] is TDateTimePicker then
                                     (Components[i] as TDateTimePicker).Enabled := false
                                else if Components[i] is TBitBtn then
                                     (Components[i] as TBitBtn).Enabled := false
                                else if Components[i] is TDBGridEh then
                                     (Components[i] as TDBGridEh).Enabled := false
                                else if Components[i] is TStringGrid then
                                     (Components[i] as TStringGrid).Enabled := false
                                else if Components[i] is TDBEdit then
                                     (Components[i] as TDBEdit).Enabled := false
                                else if Components[i] is TDBMemo then
                                     (Components[i] as TDBMemo).Enabled := false ;
                           end ;
                   end;

          end ;
      end;
end;

procedure TEditBaseForm2.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(checkNumber2(Key)) then Key:=#0;
end;
//检查输入的参数是不是数字
function TEditBaseForm2.checkNumber2(const value: string;
  const Key: Char): boolean;
begin
   if Key in ['0'..'9','.',#8] then
       begin
          if key = '.' then
              begin
                  if  pos('.',value) > 0 then
                      result := false
                  else
                      result := true ;
              end
          else
              result := true ;
       end
   else
        result := false ;
end;
//检查输入的参数是不是数字,不接收小数点
function TEditBaseForm2.checkNumber2(const Key: Char): boolean;
begin
    if Key in ['0'..'9',#8] then
        result := true
    else
        result := false ;
end;

procedure TEditBaseForm2.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (checkNumber2(Edit19.Text,key)) then key:= #0 ;
end;

function TEditBaseForm2.Get_EditMode: integer;
begin
  result := vEditMode ;
end;

procedure TEditBaseForm2.Set_EditMode(const Value: integer);
begin
  vEditMode := value ;
end;

procedure TEditBaseForm2.BitBtn6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FindDATA0050Form2:=TFindDATA0050Form2.Create(application) ;

  FindDATA0050Form2.Caption := '查找产品编号' ;
  //FindDATA0050Form2.ADOStoredProc1.Parameters.ParamValues['@TTYPE'] := 2 ;
  //FindDATA0050Form2.ADOStoredProc1.Open ;
  try
      if FindDATA0050Form2.ShowModal = mrok then
          begin
               BitBtn2.Enabled := TRUE ;
               vsave0085 := true ;
               DbEdit4.DataSource.DataSet.Edit;
               DbEdit4.Field.Value := FindDATA0050Form2.ADOStoredProc1CUSTOMER_PART_NUMBER.Value ;//  Adoquery6.Fieldbyname('customer_part_number').asstring;
               Edit18.Text:=FindDATA0050Form2.ADOStoredProc1CUSTOMER_PART_DESC.Value ;//   Adoquery6.Fieldbyname('customer_part_desc').asstring;
               Edit13.Text:=FindDATA0050Form2.ADOStoredProc1CUST_CODE.Value ;//   Adoquery6.Fieldbyname('cust_code').asstring;
               vdata0050rkey :=  FindDATA0050Form2.ADOStoredProc1RKEY.Value ;
               DM.qwzpr85_1.Edit ;
               DM.qwzpr85_1CUST_PART_PTR.Value := vdata0050rkey ;
               Edit13Exit(Sender);
          end ;
  finally
       FindDATA0050Form2.Free ;
  end ;
end;

procedure TEditBaseForm2.DBEdit4Change(Sender: TObject);
begin  //可以保存内容
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled := True ;
      end ;
end;

procedure TEditBaseForm2.DBEdit4Exit(Sender: TObject);
begin  //检查输入的本厂编号,是不是存在
  inherited;
  if (activecontrol.Name='BitBtn6') or (activecontrol.Name='BitBtn3') then exit;
  with ADOStoredProc1 do
      begin
           if Active then close ;
           Parameters.Clear ;
           ProcedureName := 'Qwzpr85;15' ;
           Parameters.CreateParameter('@RETURN_VALUE',ftinteger,pdReturnValue,0,0) ;
           Parameters.CreateParameter('@CUSTOMER_PART_NUMBER',ftstring,pdInput,20,0);
           Parameters.ParamValues['@RETURN_VALUE'] := 0 ;
           Parameters.ParamValues['@CUSTOMER_PART_NUMBER'] := DBEdit4.Text ;
           prepared;
           Open ;
           if ADOStoredProc1.RecordCount >0 then
               begin
                   DbEdit4.DataSource.DataSet.Edit;
                   DbEdit4.Field.Value := ADOStoredProc1.FieldValues['CUSTOMER_PART_NUMBER'];//.Value ;//  Adoquery6.Fieldbyname('customer_part_number').asstring;
                   Edit18.Text:= ADOStoredProc1.FieldValues['CUSTOMER_PART_DESC'];//.Value ;//   Adoquery6.Fieldbyname('customer_part_desc').asstring;
                   Edit13.Text:= ADOStoredProc1.FieldValues['CUST_CODE'];//.Value'];// ;//   Adoquery6.Fieldbyname('cust_code').asstring;
                   vdata0050rkey := ADOStoredProc1.FieldValues['RKEY'];//.Value ;
                   Edit13Exit(Sender);
               end
           else
               begin
                    vdata0050rkey := 0 ;
                    //DBEdit4.SetFocus ;
                    //showmessage('');
               end ;
           close;

            DM.qwzpr85_1.Edit ;
            IF vdata0050rkey <> 0 THEN
                DM.qwzpr85_1CUST_PART_PTR.Value := vdata0050rkey
            ELSE
                DM.qwzpr85_1CUST_PART_PTR.AsVariant := NULL ;

      end;
end;

procedure TEditBaseForm2.Edit9Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.ComboBox1Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.Edit1Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.Edit18Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.DBMemo1Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.DateTimePicker3Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.DateTimePicker4Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit10Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.Edit3Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.Edit5Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
     bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit6Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit13Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
     bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit4Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit7Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
     bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit8Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
     bitbtn2.Enabled :=True;
end;

procedure TEditBaseForm2.Edit16Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      bitbtn2.Enabled :=True;
  
end;

procedure TEditBaseForm2.ComboBox11Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True ;
          BitBtn8.Enabled := true ;
          CluckAREA();
      end ;
  Label37.Caption := '  ' +  ComboBox11.Text + ' ' ;
end;

procedure TEditBaseForm2.Edit14Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True ;
          BitBtn8.Enabled := true ;
          CluckAREA();
      end ;
end;

procedure TEditBaseForm2.Edit19Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.DBMemo2Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
      end ;
end;

procedure TEditBaseForm2.Edit13Exit(Sender: TObject);
begin  //检查输入的客户是不是存在 ,改变显示的值
  inherited;

 
end;

procedure TEditBaseForm2.BitBtn1Click(Sender: TObject);
begin  //重新选择客户
  inherited;
  EditCustForm2:=TEditCustForm2.Create(application) ;
  try
      EditCustForm2.RkeyData10 := DM.qwzpr85_1CUST_PTR.AsInteger  ;
      EditCustForm2.RkeyData01 := DM.qwzpr85_1CURR_PTR.AsInteger ;
      EditCustForm2.RkeyData09 := DM.qwzpr85_1SREP_PTR.AsInteger ;
      //EditCustForm2.RkeyData08 := DM.qwzpr85_1PROD_CODE_PTR.AsInteger ;
      if EditCustForm2.ShowModal = mrok then
          begin
               BitBtn2.Enabled := TRUE ;
               vsave0085 := true ;
               Edit5.Text := EditCustForm2.Label15.Caption ;
               Edit6.Text := EditCustForm2.Label16.Caption ;
               Edit4.Text := EditCustForm2.EDIT16.Text ;
               Edit7.Text := EditCustForm2.EDIT10.Text ;
               Edit8.Text := EditCustForm2.EDIT11.Text ;

               Edit2.Text := EditCustForm2.EDIT2.Text ;


               edit10.Text := EditCustForm2.EDIT12.Text ; //联络人
               edit3.Text  := EditCustForm2.EDIT13.Text ; //联络人电话 9
               //Edit2.Text := EditCustForm2.ADOQuery1CUSTOMER_NAME.Value ;
               DM.qwzpr85_1.Edit ;
               IF EditCustForm2.RkeyData10 <> 0 THEN
                   DM.qwzpr85_1CUST_PTR.VALUE := EditCustForm2.RkeyData10
               ELSE
                   DM.qwzpr85_1CUST_PTR.AsVariant := NULL ;
               DM.qwzpr85_1cust_name.Value := Edit2.Text ;
               DM.qwzpr85_1cust_add1.Value := EditCustForm2.EDIT3.Text ;
               DM.qwzpr85_1cust_state.Value := EditCustForm2.EDIT6.Text ;

               DM.qwzpr85_1cust_zip.Value := EditCustForm2.EDIT14.Text ;

               DM.qwzpr85_1curr_rate.AsString  := EditCustForm2.EDIT15.Text ;
               DM.qwzpr85_1payment.Value := EditCustForm2.EDIT15.Text ;

               DM.qwzpr85_1cust_phone.Value := EditCustForm2.EDIT9.Text ;
               DM.qwzpr85_1cust_fax.Value := EditCustForm2.EDIT10.Text ;
               DM.qwzpr85_1EMAIL.Value := EditCustForm2.EDIT11.Text ;

               DM.qwzpr85_1cust_contact.Value := EditCustForm2.EDIT12.Text ;
               DM.qwzpr85_1cust_contact_phone.Value := EditCustForm2.EDIT13.Text ;
               DM.qwzpr85_1markup.AsString := EditCustForm2.EDIT17.Text ;
               DM.qwzpr85_1sales_discount.AsString := EditCustForm2.EDIT18.Text ;

               DM.qwzpr85_1CURR_PTR.VALUE := EditCustForm2.RkeyData01 ;
               DM.qwzpr85_1SREP_PTR.VALUE := EditCustForm2.RkeyData09 ;
               {}
          end ;
  finally
      EditCustForm2.Free;
  end ;
end;

procedure TEditBaseForm2.BitBtn20Click(Sender: TObject);
begin
  inherited;
  FindData0008Form2:= TFindData0008Form2.Create(application) ;
  try
      FindData0008Form2.Caption := '查找产品类别' ;
      FindData0008Form2.ADOStoredProc1.Prepared ;
      FindData0008Form2.ADOStoredProc1.Open ;
      if FindData0008Form2.ShowModal = mrok then
          begin
              BitBtn2.Enabled := TRUE ;
              vsave0085 := true ;
              Edit16.Text :=FindData0008Form2.ADOStoredProc1prod_code.Value ;//FrmProdcode.adoquery1.fieldbyname('product_name').asstring;
              dm.qwzpr85_1.Edit ;
              dm.qwzpr85_1prod_code_ptr.Value :=FindData0008Form2.ADOStoredProc1rkey.Value ;//   FrmProdcode.adoquery1.fieldbyname('rkey').asstring;
          end ;
  finally
      IF FindData0008Form2.ADOStoredProc1.Active THEN FindData0008Form2.ADOStoredProc1.Close ;
      FindData0008Form2.Free;
  end ;
end;



function TEditBaseForm2.DisplayData00351(CONST VALUE:INTEGER): boolean;
begin
    result := false ;
    if not dm.qwzpr85_8.Active then
        begin
            dm.qwzpr85_22.Locate('ROW_NAME',ComboBox6.Text,[]);
            dm.qwzpr85_8.Parameters.ParamValues['@RKEY346'] := dm.qwzpr85_22RKEY.Value ;
            dm.qwzpr85_8.Open ;
        end ;


    //增加显示特别工艺内容
    if not qwzpr85_10.Active then
         begin
              qwzpr85_10.Parameters.ParamValues['@RKEY085'] :=  vRkeyData0085;//dm.qwzpr85_1rkey.value ;
              qwzpr85_10.Open ;
              IF AreaRkey <> 0 THEN
                  IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
                       BEGIN
                            qwzpr85_10.Append ;
                            qwzpr85_10QTE_PTR.Value := vRkeyData0085;// DM.qwzpr85_1RKEY.Value ;
                            qwzpr85_10UNIT_PTR.Value := AreaRkey ;
                       END ;
              IF AreaRkey2 <> 0 THEN
                  IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey2,[]) THEN
                       BEGIN
                            qwzpr85_10.Append ;
                            qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                            qwzpr85_10UNIT_PTR.Value := AreaRkey2 ;
                       END ;
              IF AreaRkey3 <> 0 THEN
                  IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey3,[]) THEN
                       BEGIN
                            qwzpr85_10.Append ;
                            qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                            qwzpr85_10UNIT_PTR.Value := AreaRkey3 ;
                       END ;

         end ;

    {IF (VALUE =0) or (VALUE =1) THEN //新增报价单
          begin
                 //增加报价的项目 ,将设置中为选中的项目写入到数据库的表中432
                 dm.qwzpr85_8.First ;
                 while not dm.qwzpr85_8.Eof do
                     begin
                         //新改  只改下面一行
                         //if dm.qwzpr85_8DEFT_SELECTED.Value  then
                             begin
                                  dm.qwzpr85_23.Append  ;
                                  dm.qwzpr85_23SOURCE_PTR.Value := dm.qwzpr85_8D0348_PTR.Value ;
                                  dm.qwzpr85_23QTE_PTR.Value := vRkeyData0085;//dm.qwzpr85_1rkey.Value ;
                                  //dm.qwzpr85_23AMOUNT.Value := NULL ;
                                  //dm.qwzpr85_23ADDL_CAT_PTR.Value := NULL ;
                                  dm.qwzpr85_23FREE_AMOUNT.Value := 0 ;
                                  dm.qwzpr85_23TAX_FLAG.Value := 'Y' ;
                                  //dm.qwzpr85_23TypeMark.Value := null ;
                                  AddQwzpr85_10(dm.qwzpr85_8D0348_PTR.Value);
                             end;
                         dm.qwzpr85_8.Next ;
                     end;
          end
    else IF VALUE = 5 THEN //编辑报价单
        begin  //检查设置的值在表432中,如果存在就为选中否则为不选中
            dm.qwzpr85_8.First ;
            while not dm.qwzpr85_8.Eof do
                begin
                     if dm.qwzpr85_23.Locate('SOURCE_PTR',dm.qwzpr85_8D0348_PTR.Value ,[]) then
                         begin  //如果值为假时改为真
                              if not(dm.qwzpr85_8DEFT_SELECTED.Value) then
                                  begin
                                       dm.qwzpr85_8.Edit ;
                                       dm.qwzpr85_8DEFT_SELECTED.Value := true;
                                  end ;
                         end
                     else
                         begin  //如果值为真时改为假
                              if dm.qwzpr85_8DEFT_SELECTED.Value then
                                  begin
                                       dm.qwzpr85_8.Edit ;
                                       dm.qwzpr85_8DEFT_SELECTED.Value := false;
                                  end ;
                         end ;

                     dm.qwzpr85_8.Next ;
                end;

        end;  {}
    dm.qwzpr85_8.First;
    result := true ;
end;

procedure TEditBaseForm2.ComboBox6Change(Sender: TObject);
VAR
  VDEL2 :BOOLEAN ;
  vsourptr3:ARRAY OF integer;
  IN5:INTEGER;
  i:integer;

begin
  inherited;
  if ComboBox6.Text = ComboBox6Text2 then exit ;
  ComboBox6Text2 := ComboBox6.Text ;

  if trim(ComboBox6.Text) <> '' then
        begin
            dm.qwzpr85_22.Locate('row_name',ComboBox6.Text,[]);
            ENGR_ROUTE_PTR0085 := dm.qwzpr85_22rkey.Value ;
            vedit20Text := dm.qwzpr85_22ROW_VALUE.AsString ;
            if combobox13.Text = '' then edit20.Text := vedit20Text;
        end ;

  //SHOWMESSAGE(ComboBox6.Text );

  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
      end ;
  //按选择的内容来显示特别工艺
  if dm.qwzpr85_23.Active then
      begin
          dm.qwzpr85_23.First ;
          IN5 := 0;
          while not dm.qwzpr85_23.Eof do
               BEGIN
                   //dm.qwzpr85_23.Delete ;
                   IF dm.qwzpr85_23TypeMark.IsNull THEN
                       begin
                           IN5 := IN5 + 1;
                           SETLENGTH(vsourptr3,IN5);
                           vsourptr3[IN5-1] := dm.qwzpr85_23SOURCE_PTR.Value ;
                           dm.qwzpr85_23.Delete;
                       end
                   ELSE
                       dm.qwzpr85_23.NEXT ;

               END ;
      end ;


  if dm.qwzpr85_8.Active then dm.qwzpr85_8.close ;

  dm.qwzpr85_22.Locate('ROW_NAME',ComboBox6.Text,[]);
  dm.qwzpr85_8.Parameters.ParamValues['@RKEY346'] := dm.qwzpr85_22RKEY.Value ;
  dm.qwzpr85_8.Open ;

  WHILE NOT dm.qwzpr85_8.Eof DO
      begin
           dm.qwzpr85_23.Append ;
           dm.qwzpr85_23QTE_PTR.Value := vRkeyData0085;
           dm.qwzpr85_23SOURCE_PTR.Value := dm.qwzpr85_8D0348_PTR.Value ;
           dm.qwzpr85_23AMOUNT.Value := 0 ;
           //dm.qwzpr85_23ADDL_CAT_PTR.Value := ;
           dm.qwzpr85_23FREE_AMOUNT.Value := 0 ;
           dm.qwzpr85_23TAX_FLAG.Value := 'Y';
           dm.qwzpr85_23TypeMark.AsVariant := null;
           //新增新参数
           AddQwzpr85_10(dm.qwzpr85_23SOURCE_PTR.Value);

           dm.qwzpr85_8.Next ;
      end ;
  dm.qwzpr85_8.First ;

          //dm.qwzpr85_8.First ;
          //while not dm.qwzpr85_8.Eof  do
          //   dm.qwzpr85_8.Delete ;


  //删除不用的参数
  for i := low(vsourptr3) to  high(vsourptr3) do
      DeleteQwzpr85_10(vsourptr3[i],false);

  //qwzpr85_10.Refresh ;
  DisplayData00351(vEditMode);

  IF TRIM(ComboBox2.Text) <> '' THEN
      if dm.qwzpr85_23.Active then
          begin
              ChangeComboBox2_5(ComboBox2,'1');
              ChangeComboBox2_5(ComboBox3,'2');
              ChangeComboBox2_5(ComboBox4,'3');
              ChangeComboBox2_5(ComboBox5,'4');
          end;

  {
  if qwzpr85_10.Active then
  begin
      qwzpr85_10.First ;
      while not qwzpr85_10.Eof do
         begin
             IF NOT( (qwzpr85_10UNIT_PTR.Value = AreaRkey)
                     OR (qwzpr85_10UNIT_PTR.Value = AreaRkey2)
                     OR (qwzpr85_10UNIT_PTR.Value = AreaRkey3) ) THEN
                 BEGIN
                     dm.qwzpr85_23.First ;
                     VDEL2 := FALSE ;
                     WHILE NOT dm.qwzpr85_23.Eof DO
                          BEGIN
                              IF ADOQuery1.Active THEN ADOQuery1.Close;
                              ADOQuery1.SQL.Clear ;
                              //ADOQuery1.Parameters.Clear ;
                              ADOQuery1.SQL.Add('SELECT RKEY FROM DATA0430 WHERE UNIT_PTR = :UNIT_PTR2 AND SOURCE_PTR = :SOURCE_PTR2');
                              ADOQuery1.Parameters.ParamValues['UNIT_PTR2'] := qwzpr85_10UNIT_PTR.Value ;
                              ADOQuery1.Parameters.ParamValues['SOURCE_PTR2'] := DM.qwzpr85_23SOURCE_PTR.Value ;
                              ADOQuery1.Open ;
                              IF NOT ADOQuery1.IsEmpty THEN
                                  VDEL2 := TRUE ;
                              ADOQuery1.Close ;
                              dm.qwzpr85_23.Next ;
                          END ;
                     IF VDEL2 THEN
                         qwzpr85_10.Delete
                     ELSE
                         qwzpr85_10.Next ;

                    //qwzpr85_10.Delete ;
                 END
             else
                 qwzpr85_10.next ;
         end ;
  end;

  if ComboBox6.Text<>'' then
      if dm.qwzpr85_22.Locate('ROW_NAME',ComboBox6.Text,[]) then
          begin   //编辑85
                dm.qwzpr85_1.Edit ;
                dm.qwzpr85_1ENGR_ROUTE_PTR.Value := dm.qwzpr85_22rkey.Value ;
          end ;

  DisplayData00351(vEditMode);

  IF TRIM(ComboBox2.Text) <> '' THEN
      if dm.qwzpr85_23.Active then
          begin
              ChangeComboBox2_5(ComboBox2,'1');
              ChangeComboBox2_5(ComboBox3,'2');
              ChangeComboBox2_5(ComboBox4,'3');
              ChangeComboBox2_5(ComboBox5,'4');
          end;
   {}
  SETLENGTH(vsourptr3,0);
  CluckAREA() ;
end;

procedure TEditBaseForm2.DBGridEh2CellClick(Column: TColumnEh);
begin
  inherited;
  { 新改
  if (vEditMode = 0) or (vEditMode = 1) then
  if dm.qwzpr85_8.Active then
     IF NOT dm.qwzpr85_8D0348_PTR.IsNull THEN
          if Column.FieldName = 'DEFT_SELECTED' then
              begin
                   if vsave01 then
                       begin
                           bitbtn2.Enabled :=True;
                           bitbtn8.Enabled :=True;
                       end ;
                   if  Column.Field.Value then
                       begin
                           //showmessage(dm.qwzpr85_8D0348_PTR.AsString )
                           DeleteQwzpr85_23 ;
                           //新的值为假,要删除以前的内容
                           DeleteQwzpr85_10(dm.qwzpr85_8D0348_PTR.Value) ;
                       end
                   else
                       begin
                           AddQwzpr85_23;
                           //新的值为真
                           AddQwzpr85_10(dm.qwzpr85_8D0348_PTR.Value) ;
                       end;
              end ;

   {}

end;

function TEditBaseForm2.DeleteQwzpr85_10(CONST VALUE:INTEGER;const value2:boolean): boolean;
var
  s:string ;
  book2:TBookmark;
  nu:integer;
begin //删除实际中不再用到的参数
    try
        s := '' ;
        with ADOStoredProc1 do
             begin
                 Parameters.Clear ;
                 ProcedureName := 'Qwzpr85;9';
                 Parameters.CreateParameter('@RETURN_VALUE',ftinteger,pdReturnValue,0,0) ;
                 Parameters.CreateParameter('@RKEY348',ftstring,pdInput,20,0);
                 Parameters.ParamValues['@RETURN_VALUE'] := 0 ;
                 Parameters.ParamValues['@RKEY348'] := VALUE ;// dm.qwzpr85_8D0348_PTR.Value ;
                 prepared;
                 Open ;
                 if not IsEmpty then    // RecordCount >0
                     begin
                         if not qwzpr85_10.Active then
                             begin
                                  qwzpr85_10.Parameters.ParamValues['@RKEY085'] :=  vRkeyData0085;//dm.qwzpr85_1rkey.value ;
                                  qwzpr85_10.Open ;
                                  IF AreaRkey <> 0 THEN
                                      IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
                                             BEGIN
                                                  qwzpr85_10.Append ;
                                                  qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                                                  qwzpr85_10UNIT_PTR.Value := AreaRkey ;
                                             END ;
                                  IF AreaRkey2 <> 0 THEN
                                      IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey2,[]) THEN
                                             BEGIN
                                                  qwzpr85_10.Append ;
                                                  qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                                                  qwzpr85_10UNIT_PTR.Value := AreaRkey2 ;
                                             END ;
                                  IF AreaRkey3 <> 0 THEN
                                      IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey3,[]) THEN
                                             BEGIN
                                                  qwzpr85_10.Append ;
                                                  qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                                                  qwzpr85_10UNIT_PTR.Value := AreaRkey3 ;
                                             END ;
                                  //if basepriceptr <> -1 then

                             end ;

                         //删除不用的数据
                         //book2 := dm.qwzpr85_8.GetBookmark ;
                         //nu := dm.qwzpr85_8D0348_PTR.Value ;
                         //dm.qwzpr85_8.DisableControls ;

                         book2 := dm.qwzpr85_23.GetBookmark ;
                         nu := dm.qwzpr85_23SOURCE_PTR.Value ;
                         dm.qwzpr85_23.DisableControls ;



                         //dm.qwzpr85_8.First ;
                         //while not dm.qwzpr85_8.Eof do
                         dm.qwzpr85_23.First ;
                         while not dm.qwzpr85_23.Eof do
                             begin
                                 //是不是选中
                                 //新改　为如下if (dm.qwzpr85_8DEFT_SELECTED.Value) and (dm.qwzpr85_8D0348_PTR.Value<>nu)  then
                                 //if (dm.qwzpr85_8D0348_PTR.Value<>nu)  then
                                     //s := s + dm.qwzpr85_8D0348_PTR.AsString+',';
                                 //dm.qwzpr85_8.Next ;
                                 if value2   then
                                     begin
                                         if (dm.qwzpr85_23SOURCE_PTR.Value<>nu)  then
                                              s := s + dm.qwzpr85_23SOURCE_PTR.AsString+',';
                                     end
                                 else
                                     s := s + dm.qwzpr85_23SOURCE_PTR.AsString+',';
                                 dm.qwzpr85_23.Next ;
                             end ;
                         if basepriceptr <> -1 then
                            s := s+inttostr(basepriceptr) +',' ;
                         //不要最后一个;号
                         s := s+'0';
                         //还要向S中加为348类型为2的

                         //showmessage('SELECT UNIT_PTR FROM Data0430 WHERE (SOURCE_PTR in ('+s+'))');
                         //dm.qwzpr85_8.EnableControls ;
                         //dm.qwzpr85_8.GotoBookmark(book2);
                         dm.qwzpr85_23.EnableControls ;
                         dm.qwzpr85_23.GotoBookmark(book2);

                         FreeBookmark(book2) ;


                         if ADOQuery1.Active then ADOQuery1.Close;
                         ADOQuery1.Parameters.Clear ;
                         ADOQuery1.SQL.Clear ;
                         ADOQuery1.SQL.Add('SELECT UNIT_PTR FROM Data0430 WHERE (SOURCE_PTR in ('+s+'))');
                         ADOQuery1.Prepared ;
                         ADOQuery1.Open;

                         if not(ADOQuery1.Locate('unit_ptr',ADOStoredProc1.FieldValues['UNIT_PTR'],[])) then
                             begin
                                  while not eof do //删除每一个不用的参数
                                      begin
                                          if (qwzpr85_10.Locate('unit_ptr',ADOStoredProc1.FieldValues['UNIT_PTR'],[])) then
                                               IF (qwzpr85_10UNIT_PTR.Value <> AreaRkey)
                                                  or (qwzpr85_10UNIT_PTR.Value <> AreaRkey2)
                                                  or (qwzpr85_10UNIT_PTR.Value <> AreaRkey3) THEN
                                                  qwzpr85_10.Delete ;
                                          next ;
                                      end ;
                             end ;
                         ADOQuery1.Close ;
                     end ;
                 {}
                 close ;
             end ;
        result := true;
    except
        result := false;
    end;
end;

function TEditBaseForm2.AddQwzpr85_10(CONST VALUE :INTEGER): boolean;
begin //向实际用到的参数表中增加要用的参数
  try
      with ADOStoredProc1 do
          begin
             Parameters.Clear ;
             ProcedureName := 'Qwzpr85;9';
             Parameters.CreateParameter('@RETURN_VALUE',ftinteger,pdReturnValue,0,0) ;
             Parameters.CreateParameter('@RKEY348',ftstring,pdInput,20,0);
             Parameters.ParamValues['@RETURN_VALUE'] := 0 ;
             Parameters.ParamValues['@RKEY348'] :=  VALUE ;//dm.qwzpr85_8D0348_PTR.Value ;
             prepared;
             Open ;
             if not IsEmpty then
                 begin
                     //增加要加的参数,不在qwzpr85_10中则增加进去
                     if not qwzpr85_10.Active then
                         begin
                              qwzpr85_10.Parameters.ParamValues['@RKEY085'] :=  vRkeyData0085;//dm.qwzpr85_1rkey.value ;
                              qwzpr85_10.Open ;
                              IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
                                   BEGIN
                                        qwzpr85_10.Append ;
                                        qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                                        qwzpr85_10UNIT_PTR.Value := AreaRkey ;
                                   END ;
                              IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey2,[]) THEN
                                   BEGIN
                                        qwzpr85_10.Append ;
                                        qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                                        qwzpr85_10UNIT_PTR.Value := AreaRkey2 ;
                                   END ;
                              IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey3,[]) THEN
                                   BEGIN
                                        qwzpr85_10.Append ;
                                        qwzpr85_10QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
                                        qwzpr85_10UNIT_PTR.Value := AreaRkey3 ;
                                   END ;

                         end ;
                     while not eof do
                         begin
                             if not(qwzpr85_10.Locate('unit_ptr',ADOStoredProc1.FieldValues['UNIT_PTR'],[])) then
                                 begin
                                      qwzpr85_10.Append ;
                                      qwzpr85_10QTE_PTR.Value := vRkeyData0085;//dm.qwzpr85_1rkey.value ;
                                      qwzpr85_10UNIT_PTR.Value := ADOStoredProc1.FieldValues['UNIT_PTR'];
                                      qwzpr85_10UNIT_VALUE.Value := '';
                                 end ;
                             next ;
                         end ;
                 end ;
             close ;
          end ;
      result := true ;
  except
      result := false;
  end ;

end;



procedure TEditBaseForm2.MaskEdit2Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True ;
          BitBtn8.Enabled := true ;
          CluckAREA();
          if sumares <> 0 then
             ComboBox13Change(sender);
          summat := 0;
          dm.qwzpr85_33.First ;
          while not dm.qwzpr85_33.Eof do
              begin
                  summat := summat + dm.qwzpr85_33D0028_PRICE.Value * sumares ;
                  dm.qwzpr85_33.Next ;
              end ;
          dm.qwzpr85_33.First ;

      end ;
end;

procedure TEditBaseForm2.MaskEdit3Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
          CluckAREA();
          if sumares <> 0 then
              ComboBox13Change(sender);
          summat := 0;
          dm.qwzpr85_33.First ;
          while not dm.qwzpr85_33.Eof do
              begin
                  summat := summat + dm.qwzpr85_33D0028_PRICE.Value * sumares ;
                  dm.qwzpr85_33.Next ;
              end ;
          dm.qwzpr85_33.First ;
      end ;
end;

procedure TEditBaseForm2.MaskEdit4Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled := True ;
          BitBtn8.Enabled := true ;
          CluckAREA() ;
          if sumares <> 0 then
             ComboBox13Change(sender);
          summat := 0;
          dm.qwzpr85_33.First ;
          while not dm.qwzpr85_33.Eof do
              begin
                  summat := summat + dm.qwzpr85_33D0028_PRICE.Value * sumares ;
                  dm.qwzpr85_33.Next ;
              end ;
          dm.qwzpr85_33.First ;
      end ;
end;

procedure TEditBaseForm2.ComboBox2Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
      end ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox2,'1');
end;

procedure TEditBaseForm2.ComboBox3Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
      end ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox3,'2');
end;

procedure TEditBaseForm2.ComboBox4Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
      end ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox4,'3') ;
end;

procedure TEditBaseForm2.ComboBox5Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
      end ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox5,'4');
end;

function TEditBaseForm2.AddQwzpr85_23: boolean;
begin
      result := false ;
      DM.qwzpr85_23.Append ;
      DM.qwzpr85_23QTE_PTR.Value := vRkeyData0085;//DM.qwzpr85_1RKEY.Value ;
      DM.qwzpr85_23SOURCE_PTR.Value := DM.qwzpr85_8D0348_PTR.Value ;
      //DM.qwzpr85_23AMOUNT.Value
      //DM.qwzpr85_23ADDL_CAT_PTR.Value
      DM.qwzpr85_23FREE_AMOUNT.Value := 0;
      DM.qwzpr85_23TAX_FLAG.Value := 'Y' ;
      //DM.qwzpr85_23TypeMark

      result := true ;


end;

function TEditBaseForm2.DeleteQwzpr85_23: boolean;
begin
   result := false ;
   IF NOT DM.qwzpr85_23.IsEmpty THEN
       if  DM.qwzpr85_23.Locate('source_ptr',dm.qwzpr85_8D0348_PTR.AsString,[])   then
           DM.qwzpr85_23.Delete ;
   result := true ;
end;

function TEditBaseForm2.ShowComboBox2_5(var sender:TComboBox;num:string): boolean;
var
  i : integer;
begin
    try
           if ADOQuery1.Active then ADOQuery1.Close;
           ADOQuery1.Parameters.Clear ;
           ADOQuery1.SQL.Clear ;
           ADOQuery1.SQL.Add('SELECT Data0348.ADDER_NAME '
                             +' FROM Data0432 INNER JOIN '
                                +' Data0348 ON Data0432.SOURCE_PTR = Data0348.RKEY '
                              +'WHERE (Data0348.TTYPE = 2) AND (Data0432.TypeMark = '+num+') AND '
                                +'(Data0432.QTE_PTR = '+dm.qwzpr85_1RKEY.AsString+')');
           ADOQuery1.Prepared ;
           ADOQuery1.Open;
           if not ADOQuery1.IsEmpty then
               begin
                   //sender.Text := ADOQuery1.FieldValues['ADDER_NAME']
                   for i := 0 to  sender.Items.Count -1 do
                       begin
                            if sender.Items[i] = ADOQuery1.FieldValues['ADDER_NAME'] then
                                begin
                                    sender.ItemIndex := i;
                                    break;
                                end ;
                       end ;

               end 
           else
               sender.ItemIndex := -1 ;
               //sender.Text := '';
           ADOQuery1.Close ;
           result := true ;
    except
         result := false;
    end ;
end;

function TEditBaseForm2.ChangeComboBox2_5(var sender: TComboBox;
  num: string): boolean;
VAR
  NNN:INTEGER;
begin
   try
      if dm.qwzpr85_23.Locate('TypeMark',num,[]) then
          begin
               if  sender.Text = '' then
                   begin //删除不用的值
                       //删除旧的参数
                       DeleteQwzpr85_10(dm.qwzpr85_23source_ptr.Value,true);
                       dm.qwzpr85_23.Delete ;
                   end
               else
                   begin //更改新的值
                         //找出对应的348中的值
                         if ADOQuery1.Active then ADOQuery1.Close;
                         ADOQuery1.Parameters.Clear ;
                         ADOQuery1.SQL.Clear ;
                         ADOQuery1.SQL.Add('SELECT rkey '
                                           +' FROM Data0348  '
                                            +'WHERE (Data0348. ADDER_NAME= '''+sender.Text+''')');
                         ADOQuery1.Prepared ;
                         ADOQuery1.Open;

                         if not ADOQuery1.IsEmpty then
                             begin
                                  //SHOWMESSAGE(INTTOSTR(ADOQuery1.FieldValues['rkey']));
                                  NNN := ADOQuery1.FieldValues['rkey'];
                                  //SHOWMESSAGE(INTTOSTR(dm.qwzpr85_23SOURCE_PTR.Value));

                                  //删除旧的参数
                                  DeleteQwzpr85_10(dm.qwzpr85_23source_ptr.Value,true);

                                  dm.qwzpr85_23.Edit ;

                                  dm.qwzpr85_23SOURCE_PTR.Value := NNN;//ADOQuery1.FieldValues['rkey'];
                                  //新增参数
                                  AddQwzpr85_10(NNN);//ADOQuery1.FieldValues['rkey'] );
                             end ;
                         ADOQuery1.Close ;
                   end ;
          end
      else
          begin
               if  sender.Text <> '' then
                   begin
                         //找出对应的348中的值
                         if ADOQuery1.Active then ADOQuery1.Close;
                         ADOQuery1.Parameters.Clear ;
                         ADOQuery1.SQL.Clear ;
                         ADOQuery1.SQL.Add('SELECT rkey '
                                           +' FROM Data0348  '
                                            +'WHERE (Data0348. ADDER_NAME= '''+sender.Text+''')') ;
                         ADOQuery1.Prepared ;
                         //SHOWMESSAGE(ADOQuery1.SQL.Text );
                         ADOQuery1.Open ;
                         if not ADOQuery1.IsEmpty then
                             begin
                                  dm.qwzpr85_23.Append  ;
                                  dm.qwzpr85_23SOURCE_PTR.Value := ADOQuery1.FieldValues['rkey'] ;
                                  dm.qwzpr85_23QTE_PTR.Value := vRkeyData0085;//dm.qwzpr85_1rkey.Value ;
                                  dm.qwzpr85_23AMOUNT.Value := 0 ;
                                  dm.qwzpr85_23ADDL_CAT_PTR.AsVariant := NULL ;
                                  dm.qwzpr85_23FREE_AMOUNT.Value := 0 ;
                                  dm.qwzpr85_23TAX_FLAG.Value := 'Y' ;
                                  dm.qwzpr85_23TypeMark.Value := strtoint(num) ;
                                  //新增参数
                                  AddQwzpr85_10(ADOQuery1.FieldValues['rkey'] );
                             end ;
                         ADOQuery1.Close ;
                   end;
          end ;
       result := true ;
   except
        on e: exception do
            begin
                result := false ;
                //showmessage('保存出错');
                messagedlg(e.Message,mtwarning,[mbcancel],0);
            end ;

   end;
end;

function TEditBaseForm2.ClackFORMULA(const value: string): string;
var
  s: string;
  s1,s2:string;
begin
   try
       if not (ProcesPARAMETERvalue) then
           begin
               showmessage('参数处理出错') ;
               exit ;
           end ;

       application.ProcessMessages ;
       s := ' '+trim(value)+' ' ;
       //在计算符前加空格,使之成为可以用的内容
       //s := repl_substr2(s);

       //常数取代程序中设的和种常数
       //repl_substr(' a ',' 2 ',s);
       //repl_substr(' b ',' 1 ',s);

       //工程参数值替代已存在的和种参数值
       if not (ProcesPARAMETER(s)) then
           begin
               showmessage('参数值处理出错') ;
               exit ;
           end ;

       //表单值取替存在的表单
       if not (ProcesTable(s)) then
           begin
               showmessage('表单值处理出错') ;
               exit ;
           end ;

       //处理IF函数,不支持里面还有IF的情况,只支持里面有表单的情况
       if not (Procesif(s)) then
           begin
               showmessage('if函数值处理出错') ;
               exit ;
           end ;


       //showmessage(s);
       result := s ;
   except
       result := '' ;
   end ;
end;
//在S中查找 sub1,如果存在就替换为 sub2
function TEditBaseForm2.repl_substr( sub1, sub2:string; var s: string): string ;
var
  i: integer;
begin
   repeat
       i := pos( sub1, s ) ;
       if i > 0 then
           begin
               delete( s, i, Length(sub1)) ;
               insert( sub2, s, i ) ;
           end;
   until i < 1 ;
   Result := s ;
end;

procedure TEditBaseForm2.Button1Click(Sender: TObject);
var
  s :string ;
  Formula2:TMyFormula2 ;
begin


  inherited;


  Formula2:=TMyFormula2.Create(dm.ADOConnection1);
  try
       Formula2.ProcessMyFormula('沉金厚度( CJHD , )');
       ClackFORMULA('沉金厚度( CJHD , )');
  finally
       Formula2.Free ;
  end ;
  {}
  //s := '35+(56-56)*25/1>1<>2>=3<=4<5+(2+5*3)';
  //repl_substr2(s);
  {
  //FindRight2(',(12345)6789((5632)23)....)');
  try
      s := ClackFORMULA('镍金厚度+LAYERS+钻孔叠板数(1.23566899,2.456899)+if((PCS>0) and (PNL = 0),0.2,1.5)');
      //showmessage(s);
      with ADOQuery1 do
          begin
               if Active then Close ;
               Parameters.Clear ;
               SQL.Clear ;
               SQL.Add('SELECT '+s+' as aaa') ;
               Prepared ;
               TRY
                   Open;
               EXCEPT
                   CLOSE ;
                   SHOWMESSAGE('公式不正确!') ;
                   EXIT ;
               END ;
               if not IsEmpty then
                  showmessage(FieldValues['aaa']) ;
               close ;
          end ;
  except

  end;   {}
end;

function TEditBaseForm2.ProcesPARAMETERvalue: boolean;
begin
  try
       if not (dm.qwzpr85_24.Active) then //dm.qwzpr85_24.Close ;
           begin
               dm.qwzpr85_24.Prepared ;
               dm.qwzpr85_24.Open;
           end ;
       dm.qwzpr85_24.First ;
       while not dm.qwzpr85_24.Eof do
           begin
                if qwzpr85_10.Locate('UNIT_PTR',dm.qwzpr85_24rkey.Value,[]) then
                    begin
                         dm.qwzpr85_24.Edit ;
                         if dm.qwzpr85_24DATA_TYPE.Value = 1 then
                             begin //数字
                                 if trim(qwzpr85_10UNIT_VALUE.Value) <> '' then
                                     dm.qwzpr85_24PARAMETER_DESC.Value := trim(qwzpr85_10UNIT_VALUE.Value)
                                 else
                                     dm.qwzpr85_24PARAMETER_DESC.Value := '0' ;
                             end
                         else  if dm.qwzpr85_24DATA_TYPE.Value = 2 then
                             begin  //字符
                                 dm.qwzpr85_24PARAMETER_DESC.Value := ''''+trim(qwzpr85_10UNIT_VALUE.Value) +'''';
                             end;
                    end
                else
                    begin
                         dm.qwzpr85_24.Edit ;
                         if dm.qwzpr85_24DATA_TYPE.Value = 1 then
                             begin //数字
                                 dm.qwzpr85_24PARAMETER_DESC.Value := '0' ;
                             end
                         else  if dm.qwzpr85_24DATA_TYPE.Value = 2 then
                             begin  //字符
                                 dm.qwzpr85_24PARAMETER_DESC.Value := ''''+''+'''';
                             end;
                    end ;
                dm.qwzpr85_24.Next ;
           end ;
       result := true;
  except
       result := false;
  end ;
end;

function TEditBaseForm2.ProcesPARAMETER(var s: string): boolean;
var
   sfrom,sto:string;
begin
  try
       dm.qwzpr85_24.First ;
       while not dm.qwzpr85_24.eof do
           begin
               sfrom :=' '+ trim(dm.qwzpr85_24PARAMETER_NAME.Value)+' ' ;
               //sto := ' '+trim(dm.qwzpr85_24PARAMETER_DESC.Value)+' ' ;
               if qwzpr85_10.Locate('unit_ptr',dm.qwzpr85_24rkey.Value,[]) then
                    if qwzpr85_10unit_value.IsNull then
                        begin
                            if dm.qwzpr85_24DATA_TYPE.Value = 1 then
                                  sto := ' '+'0'+' '
                            else if dm.qwzpr85_24DATA_TYPE.Value = 2 then
                                  sto := ' '+''''''+' ';
                        end
                    else
                        begin
                            if dm.qwzpr85_24DATA_TYPE.Value = 1 then
                                  sto := ' '+trim(qwzpr85_10unit_value.Value)+' '
                            else if dm.qwzpr85_24DATA_TYPE.Value = 2 then
                                  sto := ' '''+trim(qwzpr85_10unit_value.Value)+''' ';
                        end
               else
                   begin
                       if dm.qwzpr85_24DATA_TYPE.Value = 1 then
                          sto := ' '+'0'+' '
                       else if dm.qwzpr85_24DATA_TYPE.Value = 2 then
                          sto := ' '+'''0'''+' ';
                   end;
               repl_substr(sfrom,sto,s);
               dm.qwzpr85_24.Next ;
           end;
       result := true ;
  except
       result := false ;
  end ;
end;

function TEditBaseForm2.ProcesTable(var s: string): boolean;
var
  s1,s2,s3,sfrom,sto:string ;
  i,i0,i1,i2:integer;
begin
  try
       //打开表单数据
       if not dm.qwzpr85_25.Active then
           begin
                dm.qwzpr85_25.Prepared ;
                dm.qwzpr85_25.Open ;
           end ;
       dm.qwzpr85_25.First ;
       while not dm.qwzpr85_25.Eof do
           begin
                s1 :=' '+ trim(dm.qwzpr85_25ENG_TABLE_NAME.Value)+'( ';
                while pos(s1,s)>0 do
                    begin
                         //有表单存在
                         i := pos(s1,s);
                         i0 := pos('(',copy(s,i+1,length(s)-i-1));
                         //i1 := pos(',',copy(s,i,length(s)-i));
                         //i2 := pos(')',copy(s,i,length(s)-i));
                         //s2 := trim(copy(s,i+i0+1,i1-i0-2)); //参数1
                         //s3 := trim(copy(s,i+i1+1,i2-i1-2)); //参数2

                         i1 := pos(',',copy(s,i+i0+1,length(s)-i-i0-1)); //(到'的[了符个数
                         i2 := pos(')',copy(s,i+i0+i1+1,length(s)-i-i0-i1-1));
                         s2 := trim(copy(s,i+i0+1,i1-1)); //参数1
                         s3 := trim(copy(s,i+i0+i1+1,i2-1)); //参数2

                         sfrom :=' '+trim(copy(s,i,i0+i1+i2+1))+' ';
                         //showmessage(s2+' :  '+s3+' :  '+sfrom);
                         IF dm.qwzpr85_25DATA_TYPE.Value = 1 THEN
                               BEGIN  //返回值为数字
                                    if (s2 = '' ) or (s3 = '') then
                                    begin
                                        showmessage('表单参数不能为空');
                                        result := false;
                                        exit ;
                                    end ;
                                    with dm.qwzpr85_autocal85 do
                                        begin
                                            if Active then Close ;
                                            //Parameters.ParamValues['@vtp'] := 1;
                                            Parameters.ParamValues['@vptr'] := dm.qwzpr85_25rkey.Value ;
                                            Parameters.ParamValues['@vcol0'] := s2;
                                            Parameters.ParamValues['@vrow0'] := s3;


                                            Parameters.ParamValues['@vcol'] := StrToFloatDef(s2,0);
                                            Parameters.ParamValues['@vrow'] := StrToFloatDef(s3,0);
                                            Prepared ;
                                            Open ;
                                            sto :=trim(dm.qwzpr85_autocal85tvalue.Value);
                                            IF dm.qwzpr85_25DATA_TYPE.Value in [1,2] THEN
                                                begin
                                                    if sto='' then
                                                        sto := ' 0 '
                                                    else
                                                        sto := ' '+sto+' ';
                                                end
                                            else IF dm.qwzpr85_25DATA_TYPE.Value = 3 THEN
                                                begin
                                                     if sto='' then
                                                        sto := '  '
                                                    else
                                                        sto := ' '''+sto+''' ';
                                                end ;
                                            Close ;
                                        end;
                               END
                         else IF dm.qwzpr85_25DATA_TYPE.Value in [2] THEN
                               BEGIN  //返回值为字符
                                    if (s2 = '' ) or (s3 = '') then
                                    begin
                                        showmessage('表单参数不能为空');
                                        result := false;
                                        exit ;
                                    end ;
                                    with dm.qwzpr85_autocal85 do
                                        begin
                                            if Active then Close ;
                                            //Parameters.ParamValues['@vtp'] := 2;
                                            Parameters.ParamValues['@vptr'] := dm.qwzpr85_25rkey.Value ;
                                            Parameters.ParamValues['@vcol0'] := s2;
                                            Parameters.ParamValues['@vrow0'] := s3;
                                            Parameters.ParamValues['@vcol'] := StrToFloatDef(s2,0) ;
                                            Parameters.ParamValues['@vrow'] := StrToFloatDef(s3,0) ;
                                            Prepared ;
                                            Open ;
                                            sto :=trim(dm.qwzpr85_autocal85tvalue.Value);
                                            IF dm.qwzpr85_25DATA_TYPE.Value in [1,2] THEN
                                                begin
                                                    if sto='' then
                                                        sto := ' 0 '
                                                    else
                                                        sto := ' '+sto+' ';
                                                end
                                            else IF dm.qwzpr85_25DATA_TYPE.Value = 3 THEN
                                                begin
                                                     if sto='' then
                                                        sto := '  '
                                                    else
                                                        sto := ' '''+sto+''' ';
                                                end ;
                                            Close ;
                                        end;
                               END ;
                         //替换表单的值
                         repl_substr(sfrom,sto,s);
                    end ;
                dm.qwzpr85_25.Next;
           end;
       result := true ;
  except
       result := false ;
  end ;
end;

procedure TEditBaseForm2.BitBtn2Click(Sender: TObject);
var
  i :integer;
  vvRkeyData0085:integer;
begin  //保存
  inherited;
  if trim(ComboBox12.Text) = '' then
      begin
         showmessage('没有选择审批代码');
         exit ;
      end ;

  if (DateTimePicker3.Date <= EncodeDate(1899,12,30))
      or (DateTimePicker3.Date >= EncodeDate(2079,6,6))
     then
         begin
             showmessage('报价有效期 不允许'+#13#10+
                         '小于等于: 1899-12-30'+#13#10+
                         '或者大于等于：20079-6-6');
             exit ;
         end ;
  if (DateTimePicker1.Date <= EncodeDate(1899,12,30))
     or (DateTimePicker1.Date >= EncodeDate(2079,6,6))
     then
         begin
             showmessage('报价日期 不允许'+#13#10+
                         '小于等于: 1899-12-30'+#13#10+
                         '或者大于等于：20079-6-6');
             exit ;
         end ;
  //showmessage(dm.qwzpr85_1rkey.AsString );
  if ComboBox6.Text = '' then
      begin
           showmessage('报价产品类别不允许为空,请输入');
           TabSheet4.Show ;
           ComboBox6.SetFocus ;
           exit ;
      end ;
  if MaskEdit2.Text = '' then
      begin
          showmessage('交货长不允许为空,请输入');
          exit ;
      end ;
  if Edit2.Text = '' then
      begin
          showmessage('客户不允许为空,请输入');
          exit ;
      end ;
  if Edit16.Text = '' then
      begin
          showmessage('产品类型不允许为空,请输入');
          exit ;
      end ;
  if MaskEdit3.Text = '' then
      begin
          showmessage('交货宽不允许为空,请输入');
          exit ;
      end ;
  if MaskEdit4.Text = '' then
      begin
          showmessage('交货数量不允许为空,请输入');
          exit ;
      end ;

  if vsave0085 then
      begin
          IF NOT (dm.qwzpr85_1.State IN [dsEdit, dsInsert]) THEN
               if vRkeyData0085 = 0 then
                   begin
                       //addQNumber_1(vvmode);//新增记录
                       dm.qwzpr85_1.Edit ;
                   end
               else
                  dm.qwzpr85_1.Edit ;

          if trim(ComboBox12.Text)  <> '' then
             dm.qwzpr85_1PROD_ROUTE_PTR.Value := vPROD_ROUTE_PTR ;

          dm.qwzpr85_1QuoteType.Value  := ComboBox10.ItemIndex ;
          dm.qwzpr85_1cust_rfq.AsString := Edit9.Text ;//参考号:

          dm.qwzpr85_1cust_part_no.AsString := edit18.Text ;
          dm.qwzpr85_1cust_contact.AsString := Edit10.Text ;//联络人:
          dm.qwzpr85_1cust_phone.AsString := Edit3.Text ;//电话号码:
          dm.qwzpr85_1UNIT_LEN.AsString := MaskEdit2.Text ; //交货长
          dm.qwzpr85_1UNIT_WTH.AsString := MaskEdit3.Text ; //交货宽
          dm.qwzpr85_1qte_unit_ptr.Value := ComboBox11.ItemIndex+1;
          if basepriceptr = -1 then
              dm.qwzpr85_1BasePricePtr.AsVariant := null
          else
              dm.qwzpr85_1BasePricePtr.Value := basepriceptr ;

          dm.qwzpr85_1tunits.AsString := edit14.Text ;

          dm.qwzpr85_1BASE_PRICE.AsString := edit20.Text ; 
          if trim(combobox6.Text) <> '' then
          dm.qwzpr85_1ENGR_ROUTE_PTR.Value := ENGR_ROUTE_PTR0085 ;
          //价格
          if edit11.Text <> '' then
              begin
                  if ComboBox9.ItemIndex = 0 then
                       dm.qwzpr85_1quote_price.AsString := edit11.Text
                  else if ComboBox9.ItemIndex = 1 then
                       dm.qwzpr85_1quote_price.AsString := edit15.Text ;
              end
          else      
              dm.qwzpr85_1quote_price.AsInteger := 0 ;



          if edit12.Text <> '' then
              begin
                  if ComboBox9.ItemIndex = 0 then
                       dm.qwzpr85_1quote_taxprice.AsString := edit12.Text
                  else if ComboBox9.ItemIndex = 1 then
                       dm.qwzpr85_1quote_taxprice.AsString := edit17.Text ;
              end
          else
              dm.qwzpr85_1quote_taxprice.AsInteger := 0 ;

          if trim(ComboBox7.text) = '' then
               dm.qwzpr85_1vatax.AsString := '0'
          else
               dm.qwzpr85_1vatax.AsString := ComboBox7.text ;

          //此三句有问题
          if DateTimePicker3.Date > EncodeDate(1899,12,30) then
              if  not  ((yearof(DateTimePicker3.date) = 1899)
                and (monthof(DateTimePicker3.date) =12)
                and (yearof(DateTimePicker3.date) =30)) then
                  dm.qwzpr85_1.FieldByName('expiration_date').AsString   := trim(datetostr(DateTimePicker3.date));

          if DateTimePicker1.Date > EncodeDate(1899,12,30) then
              if not ((yearof(DateTimePicker1.date)=1899)
                and (monthof(DateTimePicker1.date)=12)
                and (yearof(DateTimePicker1.date)=30)) then
                  dm.qwzpr85_1.FieldByName('qte_date').AsString   := trim(datetostr(DateTimePicker1.Date)) ;
          if MaskEdit4.Text <>'' then
              dm.qwzpr85_1qte_units.AsString   := MaskEdit4.Text  //交货数量
          else
              dm.qwzpr85_1qte_units.Value := 0 ;
          dm.qwzpr85_1QuoteType.AsInteger := ComboBox9.ItemIndex ;

      end ;

  for i := 1 to 4 do //保存用户修改后的值
      begin
          if DM.qwzpr85_23.Locate('typemark',i,[]) then
             begin
                 BitBtn2.Enabled := true ;
                 DM.qwzpr85_23.Edit ;
                 if trim(StringGrid1.Cells[2,i]) <> '' then
                    DM.qwzpr85_23amount.AsString := trim(StringGrid1.Cells[2,i])
                 else
                     DM.qwzpr85_23amount.Value := 0 ;
             end ;
      end ;
   {}
  dm.ADOConnection1.BeginTrans ;
  try
      dm.qwzpr85_1.UpdateBatch(); //报价单  0085
      //dm.qwzpr85_8.UpdateBatch(); //351
      if vRkeyData0085 = 0 then
          begin
              vvRkeyData0085 := dm.qwzpr85_1rkey.Value ;
              dm.qwzpr85_33.First ;
              while not dm.qwzpr85_33.Eof do
                  begin
                      dm.qwzpr85_33.Edit ;
                      dm.qwzpr85_33QUOTE_PTR.Value := vvRkeyData0085;
                      dm.qwzpr85_33.Next ;
                  end ;

              qwzpr85_10.First ;
              while not qwzpr85_10.Eof do
                  begin
                      qwzpr85_10.Edit ;
                      self.qwzpr85_10QTE_PTR.Value  :=  vvRkeyData0085 ;
                      qwzpr85_10.Next ;
                  end ;
              dm.qwzpr85_23.First ;
              while not dm.qwzpr85_23.Eof do
                  begin
                      dm.qwzpr85_23.Edit ;
                      dm.qwzpr85_23QTE_PTR.Value   :=  vvRkeyData0085 ;
                      dm.qwzpr85_23.Next ;
                  end ;
          end ;
      qwzpr85_10.UpdateBatch(); //参数值  0431
      dm.qwzpr85_23.UpdateBatch(); //特别费用及特别工艺  0432
      dm.qwzpr85_33.UpdateBatch(); //材料费用
      dm.ADOConnection1.CommitTrans ;

      vRkeyData0085 := vvRkeyData0085;//
      BitBtn2.Enabled := false ;
      vsave0085 := false ;
      //dm.qwzpr85_1.Refresh ;
  except
        on e: exception do
            begin
                dm.ADOConnection1.RollbackTrans ;
                //showmessage('保存出错');
                messagedlg('保存出错  '+e.Message,mtwarning,[mbcancel],0);
            end ;
  end ;
  {}
end; //保存
function TEditBaseForm2.ProcesIf0(const value: string;
                                  var s: string): boolean;
var
  s1,s2,s3,s4,sfrom,sto:string ;
  i,i0,i1,i2,i3:integer;
begin
  try
      s1 :=value;
      while pos(s1,s) > 0 do
          begin
               //有if存在
               i := pos(s1,s);
               i0 := pos('( ',copy(s,i+1,length(s)-i-1));
               //i1 := pos(',',copy(s,i,length(s)-i));
               //i3 :=POS(',',copy(s,i+i1+1,length(s)-i1-i-1));
               //i2 := pos(')',copy(s,i,length(s)-i));
               //s2 := trim(copy(s,i+i0+1,i1-i0-2)); // 条件
               //s3 := trim(copy(s,i+i1+1,i3-2)); // 真
               //s4 := trim(copy(s,i+i1+i3+1,i2-i1-i3-2)); // 假
               //sfrom :=' '+trim(copy(s,i,i2))+' ';

               i1 := pos(',',copy(s,i+i0+1,length(s)-i-i0-1));
               i3 :=POS(',',copy(s,i+i1+i0+1,length(s)-i1-i-i0-1));
               i2 := pos(')',copy(s,i+i0+i1+i3+1,length(s)-i-i0-i1-i3));
               s2 := trim(copy(s,i+i0+1,i1-1)); // 条件
               s3 := trim(copy(s,i+i0+i1+1,i3-1)); // 真
               s4 := trim(copy(s,i+i0+i1+i3+1,i2-1)); // 假
               sfrom :=' '+trim(copy(s,i,i0+i1+i3+i2+1))+' ';
               with ADOQuery1 do
                   begin
                         if Active then Close;
                         Parameters.Clear ;
                         SQL.Clear ;
                         SQL.Add('SELECT 1 as aa2 WHERE '+s2);
                         Prepared ;
                         Open;
                         if IsEmpty then  //假
                              sto := ' '+s4+' '
                         else //真
                              sto := ' '+s3+' ' ;
                         close;
                   end ;
               //替换值
               repl_substr(sfrom,sto,s);
          end;
      result := true ;
  except
      result := false ;
  end ;
end;


function TEditBaseForm2.ProcesIf(var s: string): boolean;
begin
  try
      result :=  TRUE ;
      result := result AND  ProcesIf0(' IF( ',s);
      result := result AND  ProcesIf0(' iF( ',s);
      result := result AND  ProcesIf0(' If( ',s);
      result := result AND  ProcesIf0(' if( ',s);
  except
      result := false ;
  end ;
end;

function TEditBaseForm2.FindRight2(const s: string): integer;
var
  k:integer;
  i , j ,i1,j1: integer ;
  s1 , s2 : string ;
begin
   try
        k := 0 ;
        s1 := s ;
        i := pos('(',s1) ;
        j := pos(')',s1) ;
        if i = 0 then //之前没有左括号,直接返回右括号的值
            k := j
        else
            begin
                if i > j then //左括号在右括号的右边,直接返回值
                    k := j
                else
                    begin
                         i1 := i ;
                         j1 := j;
                         while i1 < j1 do
                             begin
                                  i := pos('(',copy(s1,i1+1,length(s1)-i1)) ;
                                  j := pos(')',copy(s1,j1+1,length(s1)-j1)) ;
                                  IF I=0 THEN
                                      BEGIN
                                         //SHOWMESSAGE(copy(s1,j1+1,length(s1)-j1));
                                         J1 := J1+ J ;
                                         BREAK ;
                                      END
                                  ELSE
                                      BEGIN
                                          i1 := i1 + i ;
                                          j1 := j1 + j;
                                      END ;
                             end;
                         k := j1 ;
                    end ;
            end;
        result := k ;
   except
        result := 0 ;
   end ;
end;

procedure TEditBaseForm2.qwzpr85_10AfterScroll(DataSet: TDataSet);
begin
  inherited;
   DBGridEh1.Columns[4].PickList.Clear ;
   if dm.qwzpr85_26.Active then dm.qwzpr85_26.Close ;
   dm.qwzpr85_26.Parameters.ParamValues['@parameter_ptr'] := self.qwzpr85_10UNIT_PTR.Value ;
   dm.qwzpr85_26.Prepared ;
   dm.qwzpr85_26.Open ;
   if not dm.qwzpr85_26.IsEmpty then
       begin
            while not dm.qwzpr85_26.Eof do
                begin
                     //DBGridEh1.Columns[4].PickList.
                     DBGridEh1.Columns[4].PickList.Add(dm.qwzpr85_26tvalue.value);
                     dm.qwzpr85_26.Next ;
                end ;
       end ;
   dm.qwzpr85_26.Close ;
end;

procedure TEditBaseForm2.FormResize(Sender: TObject);
begin
  inherited;
  //
  DBGridEh1.Columns[4].Width := DBGridEh1.Width
                                  - DBGridEh1.Columns[0].Width
                                  - DBGridEh1.Columns[1].Width
                                  - DBGridEh1.Columns[2].Width
                                  - DBGridEh1.Columns[3].Width
                                  - 40 ;

  DBGridEh2.Columns[0].Width := DBGridEh2.Width
                                  // - DBGridEh2.Columns[1].Width
                                  - 40 ;
end;

procedure TEditBaseForm2.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ComboBox2.ItemIndex := -1;
  BitBtn8.Enabled := true ;
  BitBtn2.Enabled := true ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox2,'1') ;
end;

procedure TEditBaseForm2.BitBtn7Click(Sender: TObject);
begin
  inherited;
  ComboBox3.ItemIndex := -1;
  BitBtn8.Enabled := true ;
  BitBtn2.Enabled := true ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox3,'2');
end;

procedure TEditBaseForm2.BitBtn12Click(Sender: TObject);
begin
  inherited;
  ComboBox4.ItemIndex := -1;
  BitBtn8.Enabled := true ;
  BitBtn2.Enabled := true ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox4,'3');
end;

procedure TEditBaseForm2.BitBtn13Click(Sender: TObject);
begin
  inherited;
  ComboBox5.ItemIndex := -1 ;
  BitBtn8.Enabled := true ;
  BitBtn2.Enabled := true ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox2_5(ComboBox5,'4') ;
end;

procedure TEditBaseForm2.BitBtn8Click(Sender: TObject);
var
  s,s1 : string ;
  value,minvalue,maxvalue:single ;
begin
  inherited;
  //交货面积,平方毫米
  IF sumares <= 0 THEN EXIT ;
  IF qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
     BEGIN
          qwzpr85_10.Edit ;
          qwzpr85_10UNIT_VALUE.Value :=  FloatToStr(sumares) ;
     END ;
  if DM.qwzpr85_1CURR_RATE.IsNull then
     begin
         showmessage('请先选择客户，以便有汇率！.....');
         exit;
     end ;

  bitbtn2.Enabled := true ;
  if (MaskEdit2.Text <> '')
          and (MaskEdit3.Text <> '')
          and (MaskEdit4.Text <> '') then
      begin
          dm.qwzpr85_23.First ;
          while not dm.qwzpr85_23.Eof do
              begin
                   with ADOStoredProc1 do
                       begin
                           if Active then close;
                           Parameters.Clear ;
                           ProcedureName := 'Qwzpr85;21';
                           Parameters.CreateParameter('@RETURN_VALUE',ftinteger,pdReturnValue,0,0) ;
                           Parameters.CreateParameter('@source_ptr',ftinteger,pdInput,0,0);
                           Parameters.ParamValues['@RETURN_VALUE'] := 0 ;
                           Parameters.ParamValues['@source_ptr'] := dm.qwzpr85_23source_ptr.Value ;
                           prepared;
                           Open ;
                           //计算出每一个项的值

                           if not ADOStoredProc1.IsEmpty then
                               begin
                                   try
                                        value := 0;
                                        minvalue := 0 ;
                                        maxvalue := 0 ;
                                        if not ADOStoredProc1.FieldByName('FORMULA').IsNull then
                                            if trim(ADOStoredProc1.FieldValues['FORMULA']) <> '' then
                                                begin
                                                    s1 := ADOStoredProc1.FieldValues['FORMULA'];
                                                    s := ClackFORMULA(s1);
                                                    //showmessage(s);
                                                    with ADOQuery1 do
                                                        begin
                                                             if Active then Close;
                                                             Parameters.Clear ;
                                                             SQL.Clear ;
                                                             SQL.Add('SELECT '+s+' as aaa');
                                                             Prepared ;
                                                             TRY
                                                                 Open;
                                                             EXCEPT
                                                                 CLOSE ;
                                                                 SHOWMESSAGE('公式不正确!');
                                                                 EXIT ;
                                                             END ;
                                                             if not IsEmpty then
                                                                 begin
                                                                     //showmessage(FieldValues['aaa']) ;
                                                                     if ADOStoredProc1.FieldValues['Pcents'] = 0 then
                                                                         value := FieldValues['aaa']
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 1 then
                                                                         begin
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 2 then
                                                                         begin
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 3 then
                                                                         begin
                                                                             value := FieldValues['aaa']*strtofloat(edit20.Text) * sumares;
                                                                         end ;


                                                                 end ;
                                                             close;
                                                        end ;
                                                end;
                                        //最小值
                                        if not ADOStoredProc1.FieldByName('MIN_VALUE').IsNull then
                                            if trim(ADOStoredProc1.FieldValues['MIN_VALUE']) <> '' then
                                                begin
                                                    s1 := ADOStoredProc1.FieldValues['MIN_VALUE'];
                                                    s := ClackFORMULA(s1);
                                                    //showmessage(s);
                                                    with ADOQuery1 do
                                                        begin
                                                             if Active then Close;
                                                             Parameters.Clear ;
                                                             SQL.Clear ;
                                                             SQL.Add('SELECT '+s+' as aaa');
                                                             Prepared ;
                                                             TRY
                                                                 Open;
                                                             EXCEPT
                                                                 CLOSE ;
                                                                 SHOWMESSAGE('公式不正确!');
                                                                 EXIT ;
                                                             END ;
                                                             if not IsEmpty then
                                                                 begin
                                                                     //showmessage(FieldValues['aaa']) ;
                                                                     if ADOStoredProc1.FieldValues['Pcents'] = 0 then
                                                                         begin
                                                                             minvalue := FieldValues['aaa'];
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 1 then
                                                                         begin
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 2 then
                                                                         begin
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 3 then
                                                                         begin
                                                                              minvalue := FieldValues['aaa']* strtofloat(edit20.Text) * sumares;
                                                                         end ;
                                                                     if value < minvalue then
                                                                          minvalue := value ;

                                                                 end ;
                                                             close;
                                                        end ;
                                                end ;

                                        //最大值
                                        if not ADOStoredProc1.FieldByName('MAX_VALUE').IsNull then
                                            if trim(ADOStoredProc1.FieldValues['MAX_VALUE']) <> '' then
                                                begin
                                                    s1 := ADOStoredProc1.FieldValues['MAX_VALUE'];
                                                    s := ClackFORMULA(s1);
                                                    //showmessage(s);
                                                    with ADOQuery1 do
                                                        begin
                                                             if Active then Close;
                                                             Parameters.Clear ;
                                                             SQL.Clear ;
                                                             SQL.Add('SELECT '+s+' as aaa');
                                                             Prepared ;
                                                             TRY
                                                                 Open;
                                                             EXCEPT
                                                                 CLOSE ;
                                                                 SHOWMESSAGE('公式不正确!');
                                                                 EXIT ;
                                                             END ;
                                                             if not IsEmpty then
                                                                 begin
                                                                     //showmessage(FieldValues['aaa']) ;
                                                                     if ADOStoredProc1.FieldValues['Pcents'] = 0 then
                                                                         begin
                                                                             maxvalue := FieldValues['aaa'];
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 1 then
                                                                         begin

                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 2 then
                                                                         begin
                                                                         end
                                                                     else if ADOStoredProc1.FieldValues['Pcents'] = 3 then
                                                                         begin
                                                                             maxvalue := FieldValues['aaa']*strtofloat(edit20.Text )* sumares;
                                                                         end ;

                                                                     if value > maxvalue  then
                                                                         value := maxvalue ;

                                                                 end ;
                                                             close;
                                                        end ;
                                                end ;

                                          dm.qwzpr85_23.Edit ;
                                          //dm.qwzpr85_23amount.Value := value ;
                                          //dm.qwzpr85_23free_amount.Value := value ;
                                          //2007-3-9将上面两行改为如下两行，在计算公式中的单位按：价格／平方米
                                          
                                          dm.qwzpr85_23amount.Value := value * sumares;
                                          dm.qwzpr85_23free_amount.Value := value * sumares;
                                          
                                   except

                                   end;   {}
                               end;

                           close ;
                       end ;
                   dm.qwzpr85_23.Next ;
              end;
          BitBtn8.Enabled := FALSE ;
          DisplyDatadata0432 ;
      end
  else
       showmessage('不允许出货长宽及数量为空,请输入值') ;

end;

procedure TEditBaseForm2.DataSource85_10DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  {
  if vsave01 then
     BitBtn8.Enabled := true ;
  {}
end;

procedure TEditBaseForm2.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //只能输入0..9的数字与一个小数点
  CheckMaskEditKeyPress(sender,key,1);
end;

procedure TEditBaseForm2.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CheckMaskEditKeyPress(sender,key,1);
end;

procedure TEditBaseForm2.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //只能输入0..9的数字
  CheckMaskEditKeyPress(sender,key,0);
end;

function TEditBaseForm2.repl_substr2(var s: string): string;
const
   TOperator = ['+','-','*','/','(',')',',','''','>','<','='] ;
   TOperator1 = ['+','-','*','/',','] ;
var
   ws,wsto: widestring ;
   s1,s2:string ;
   i ,i1: integer ;
   j : integer;
begin
   result := '';
   ws := widestring(s) ;
   //showmessage(ws+'   '+inttostr(length(ws))) ;
   i1 := 1;
   s2 := '';
   wsto := '';
   for i := 1 to length(ws) do
       begin
           s1 := ws[i] ;
           s2 := s2 + s1 ;
           if char(ws[i]) in TOperator then
               begin
                   //showmessage(copy(ws,i1,i-i1)) ;
                   if char(ws[i]) in TOperator1 then   //加减乘除逗号的前后加空格
                       wsto := wsto + copy(ws,i1,i-i1) + ' '+ ws[i]+' '
                   else if ws[i] = '(' then //左括号后加空格
                       wsto := wsto + copy(ws,i1,i-i1) +  ws[i]+' '
                   else if ws[i] = ')' then  //右括号前加空格
                       wsto := wsto + copy(ws,i1,i-i1) + ' '+ ws[i]
                   else if ws[i] = '>' then  //处理>,<,=符号
                       begin
                           if ws[i+1] = '=' then   //是不是>=
                               wsto := wsto + copy(ws,i1,i-i1) + ' '
                           else if ws[i-1] = '<' then   //是不是>=
                               wsto := wsto + copy(ws,i1,i-i1) + ws[i-1] + ws[i] + ' '
                           else
                               wsto := wsto + copy(ws,i1,i-i1) + ' '+ ws[i]+' ';
                       end
                   else if ws[i] = '<' then
                       begin
                           if (ws[i+1] = '=') or (ws[i+1] = '>') then   //是不是<=  ,<>
                               wsto := wsto + copy(ws,i1,i-i1) + ' '
                           else
                               wsto := wsto + copy(ws,i1,i-i1) + ' '+ ws[i]+' ';
                       end
                   else if ws[i] = '=' then
                       begin
                           if (ws[i-1] = '<') or (ws[i-1] = '>') then   //是不是<= ,>=
                               wsto := wsto + copy(ws,i1,i-i1) + ws[i-1] + ws[i] + ' '
                           else
                               wsto := wsto + copy(ws,i1,i-i1) + ' '+ ws[i]+' ';
                       end
                   else
                      begin
                      end ;

                   s2 := '' ;
                   i1 := i + 1 ;
               end ;
       end ;
   if i1 <= length(ws) then
   wsto := wsto + ' ' + copy(ws,i1,length(ws) - i1 + 1  ) ;
   //s := string(wsto);
   result := string(wsto) ;

end;

procedure TEditBaseForm2.qwzpr85_10BeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if vsave01 then
      begin
          BitBtn2.Enabled := true ;
          BitBtn8.Enabled := TRUE ;
      end ;
end;

procedure TEditBaseForm2.BitBtn14Click(Sender: TObject);
begin
  DisplyDatadata0432 ;
end;

function TEditBaseForm2.CluckAREA: BOOLEAN;
begin
  IF (TRIM(MaskEdit2.Text) <> '')
    AND (TRIM(MaskEdit3.Text) <> '')
    AND (TRIM(MaskEdit4.Text) <> '')
    AND (TRIM(Edit14.Text) <> '')
    THEN
      BEGIN
           if ComboBox11.ItemIndex = 0 then //按PCS交货
               sumares := strtofloat(MaskEdit2.Text)*strtofloat(MaskEdit3.Text)*(strtoint(MaskEdit4.Text)/strtoint(Edit14.Text)) / RATEMMTOM5
           else if ComboBox11.ItemIndex = 1 then  //按SET交货
               sumares := strtofloat(MaskEdit2.Text)*strtofloat(MaskEdit3.Text)*strtoint(MaskEdit4.Text) / RATEMMTOM5  ;



           if qwzpr85_10.Active then
               begin
                   IF qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
                       BEGIN
                            qwzpr85_10.edit ;
                            qwzpr85_10UNIT_value.Value  := floattostr(sumares) ;
                       END ;
                   IF qwzpr85_10.Locate('UNIT_PTR',AreaRkey2,[]) THEN
                       BEGIN
                            qwzpr85_10.edit ;
                            qwzpr85_10UNIT_value.Value  := MaskEdit2.Text ;
                       END ;
                   IF qwzpr85_10.Locate('UNIT_PTR',AreaRkey3,[]) THEN
                       BEGIN
                            qwzpr85_10.edit ;
                            qwzpr85_10UNIT_value.Value  := MaskEdit3.Text ;
                       END ;
               end ;
      END ;
end;

procedure TEditBaseForm2.BitBtn9Click(Sender: TObject);
begin
  inherited;
  PrintForm2 := TPrintForm2.Create(application)  ;
  try
       if PrintForm2.ADOData0085.Active then PrintForm2.ADOData0085.Close;
       if vEditMode <> 3 then
           begin
               PrintForm2.ADOData0085.Parameters.ParamValues['vptr'] := dm.qwzpr85_1RKEY.Value;//dm.qwzpr85_1RKEY.Value ;

               PrintForm2.ADOQuery1.Parameters.ParamValues['qte_ptr'] := dm.qwzpr85_1RKEY.Value;
               PrintForm2.ADOQuery2.Parameters.ParamValues['qte_ptr'] := dm.qwzpr85_1RKEY.Value;
               PrintForm2.ADOQuery3.Parameters.ParamValues['qte_ptr'] := dm.qwzpr85_1RKEY.Value;
               PrintForm2.ADOQuery4.Parameters.ParamValues['qte_ptr'] := dm.qwzpr85_1RKEY.Value;
           end
       else
           begin
               PrintForm2.ADOData0085.Parameters.ParamValues['vptr'] := dm.ds85RKEY.Value;//dm.ds85RKEY.Value ;
               PrintForm2.ADOQuery1.Parameters.ParamValues['qte_ptr'] := dm.ds85RKEY.Value;
               PrintForm2.ADOQuery2.Parameters.ParamValues['qte_ptr'] := dm.ds85RKEY.Value;
               PrintForm2.ADOQuery3.Parameters.ParamValues['qte_ptr'] := dm.ds85RKEY.Value;
               PrintForm2.ADOQuery4.Parameters.ParamValues['qte_ptr'] := dm.ds85RKEY.Value;
           end;
       PrintForm2.ADOData0085.Open;
       PrintForm2.ADOQuery1.Open ;
       PrintForm2.ADOQuery2.Open ;
       PrintForm2.ADOQuery3.Open ;
       PrintForm2.ADOQuery4.Open ;

       if dm.ADOQPrint1.Active then dm.ADOQPrint1.Close ;
       if vEditMode <> 3 then
           begin
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR1'] := dm.qwzpr85_1RKEY.Value;//dm.qwzpr85_1RKEY.Value ;
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR2'] := dm.qwzpr85_1RKEY.Value;//dm.qwzpr85_1RKEY.Value ;
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR3'] := dm.qwzpr85_1RKEY.Value;//dm.qwzpr85_1RKEY.Value ;
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR4'] := dm.qwzpr85_1RKEY.Value;//dm.qwzpr85_1RKEY.Value ;
           end
       else
           begin
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR1'] := dm.ds85RKEY.Value ;
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR2'] := dm.ds85RKEY.Value ;
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR3'] := dm.ds85RKEY.Value ;
               dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR4'] := dm.ds85RKEY.Value ;
           end ;
       dm.ADOQPrint1.Open;

       if dm.ADOQPrint2.Active then dm.ADOQPrint2.Close ;

       if vEditMode <> 3 then
           begin
              dm.ADOQPrint2.Parameters.ParamValues['QTE_PTR1'] := dm.qwzpr85_1RKEY.Value;//dm.qwzpr85_1RKEY.Value ;
           end
       else
           dm.ADOQPrint2.Parameters.ParamValues['QTE_PTR1'] := dm.ds85RKEY.Value;//dm.ds85RKEY.Value ;

       dm.ADOQPrint2.Open;

       if not (dm.TDATA0493.Active) then dm.TDATA0493.Open ;
       //SHOWMESSAGE(PrintForm2.ppReport1.Template.FileName );  //
       //PrintForm2.ppReport1.Template.SaveTo := stFile;// 'E:\exec\NIERP\Report\qquote1.rtm';
       //SHOWMESSAGE(PrintForm2.ppReport1.Template.FileName );
       PrintForm2.ppReport1.Print ;
  finally
       PrintForm2.Free ;
  end ;
end;

procedure TEditBaseForm2.StringGrid1KeyPress(Sender: TObject;
                                              var Key: Char);
begin
  inherited;
  if trim(StringGrid1.Cells[0,StringGrid1.Row]) = '' then
      key := #0
  else
      begin
           if key in ['0'..'9','.',#8,#13] then
               begin
                   if key = '.' then
                       begin
                           if pos('.',trim(StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row])) > 0  then
                               Key := #0 ;//abort ;
                       end
                   else
                       begin
                            if vsave01 then
                                begin
                                    BitBtn2.Enabled := true ;
                                    
                                    vsave0085 := TRUE ;
                                end ;
                       end ;
               end
           else
              Key := #0 ;//abort;
      end ;
end;

procedure TEditBaseForm2.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if DBGridEh2.DataSource.DataSet.Active then
      if not (gdFixed in State) then
           DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TEditBaseForm2.FormPaint(Sender: TObject);
begin
  inherited;
  DBGridEh1.Columns[4].Width := DBGridEh1.Width
                                  - DBGridEh1.Columns[0].Width
                                  - DBGridEh1.Columns[1].Width
                                  - DBGridEh1.Columns[2].Width
                                  - DBGridEh1.Columns[3].Width
                                  - 40 ;
  DBGridEh2.Columns[0].Width := DBGridEh2.Width
                                  //- DBGridEh2.Columns[1].Width
                                  - 40 ;
end;

function TEditBaseForm2.DisplyDatadata0432: boolean;
var
  i:integer;
  v2,v3,v4: single;
begin
  inherited;
  result := false ;
  i := 1;  v2 := 0 ;
  if dm.qwzpr85_29.Active then dm.qwzpr85_29.Close ;
  dm.qwzpr85_29.Prepared ;
  dm.qwzpr85_29.Open;
  StringGrid2.RowCount := 2 ;
  dm.qwzpr85_23.First ;
  while not dm.qwzpr85_23.Eof do
      begin
           if not dm.qwzpr85_23typemark.IsNull then
               begin
                   if not (dm.qwzpr85_23typemark.Value in [1,2,3,4]) then
                       begin
                            StringGrid2.RowCount := StringGrid2.RowCount + 1 ;
                            if dm.qwzpr85_29.Locate('rkey',dm.qwzpr85_23source_ptr.Value,[]) then
                                  StringGrid2.Cells[0,i] := dm.qwzpr85_29adder_name.AsString  ;
                            StringGrid2.Cells[1,i] := dm.qwzpr85_23free_amount.AsString ;
                            v2 :=v2+ dm.qwzpr85_23free_amount.Value ;
                            i := i + 1 ;
                       end ;
               end
           else
                   begin
                        StringGrid2.RowCount := StringGrid2.RowCount + 1 ;
                        if dm.qwzpr85_29.Locate('rkey',dm.qwzpr85_23source_ptr.Value,[]) then
                                  StringGrid2.Cells[0,i] := dm.qwzpr85_29adder_name.AsString ;
                        StringGrid2.Cells[1,i] := dm.qwzpr85_23free_amount.AsString ;
                        v2 :=v2+ dm.qwzpr85_23free_amount.Value ;
                        i := i + 1 ;
                   end ;
           dm.qwzpr85_23.Next ;
      end ;
  dm.qwzpr85_29.Close ;
  StringGrid2.Cells[0,i] := '合计' ;
  StringGrid2.Cells[1,i] := floattostr(v2) ;
 //清除以前的数据
 for i := 1 to 4 do
     begin
           StringGrid1.Cells[0,i] := '' ;
           StringGrid1.Cells[1,i] := '' ;
           StringGrid1.Cells[2,i] := '' ;
           StringGrid1.Cells[3,i] := '' ;
     end ;

 IF DM.qwzpr85_23.Locate('TYPEMARK',1,[]) THEN
      BEGIN
           StringGrid1.Cells[0,1] := ' 工程费 ' ;
           StringGrid1.Cells[1,1] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,1] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,1] := '1';
      END ;
  IF DM.qwzpr85_23.Locate('TYPEMARK',2,[]) THEN
      BEGIN
           StringGrid1.Cells[0,2] := ' 制板费 ' ;
           StringGrid1.Cells[1,2] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,2] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,2] := '1' ;
      END ;
  IF DM.qwzpr85_23.Locate('TYPEMARK',3,[]) THEN
      BEGIN
           StringGrid1.Cells[0,3] := ' 菲林费 ' ;
           StringGrid1.Cells[1,3] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,3] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,3] := '1' ;
      END ;
  IF DM.qwzpr85_23.Locate('TYPEMARK',4,[]) THEN
      BEGIN
           StringGrid1.Cells[0,4] := ' 测试费 ' ;
           StringGrid1.Cells[1,4] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,4] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,4] := '1' ;
      END ;

  v3 := v2 ; v4 := v2 ;
  for i := 1 to StringGrid1.RowCount - 1 do
      begin
           if trim(StringGrid1.Cells[1,i]) <> '' then
               v3 := v3 + strtofloat(StringGrid1.Cells[1,i]) ;
           if trim(StringGrid1.Cells[2,i]) <> '' then
               v4 := v4 + strtofloat(StringGrid1.Cells[2,i]) ;
      end ;
  //新增2007-4-9,基本加工费
  v3 := v3 + sumares*strtofloat(edit20.text);
  v4 := v4 + sumares*strtofloat(edit20.text);
  v3 := v3 + summat ;
  v4 := v4 + summat ;

  Label30.Caption := floattostr(v3) ;
  


  // 除汇率得到原币　DM.qwzpr85_1CURR_RATE
  if DM.qwzpr85_1CURR_RATE.IsNull then
      begin
         //showmessage('null');
      end
  else
      begin
          //showmessage(DM.qwzpr85_1CURR_RATE.AsString);
          edit11.Text := format('%.'+trim(combobox8.Text)+'f',[v4/DM.qwzpr85_1CURR_RATE.Value]);//) ;  ///DM.qwzpr85_1CURR_RATE.Value
          if ComboBox7.Text <> '' then
              edit12.Text := format('%.'+trim(combobox8.Text)+'f',[v4*(1+strtofloat(ComboBox7.Text)/100)/DM.qwzpr85_1CURR_RATE.Value])  ///DM.qwzpr85_1CURR_RATE.Value
          else
              edit12.Text := edit11.Text ;
          if MaskEdit4.Text <> '0' then
             begin
                if strtointdef(MaskEdit4.Text,0) <> 0 then
                    edit15.Text := format('%.'+trim(combobox8.Text)+'f',[v4/strtoint(MaskEdit4.Text)/DM.qwzpr85_1CURR_RATE.Value]) ///DM.qwzpr85_1CURR_RATE.Value

             end
          else
              edit15.Text := format('%.'+trim(combobox8.Text)+'f',[0.0]) ;
          if ComboBox7.Text <> '' then
              begin
                  if MaskEdit4.Text <> '0' then
                      edit17.Text := format('%.'+trim(combobox8.Text)+'f',[v4/strtoint(MaskEdit4.Text)*(1+strtofloat(ComboBox7.Text)/100)/DM.qwzpr85_1CURR_RATE.Value]) ///DM.qwzpr85_1CURR_RATE.Value
                  else
                       edit17.Text := format('%.'+trim(combobox8.Text)+'f',[0.0]);
              end
          else
              edit17.Text := edit15.Text ;
      end;
  result := true ;
end;

procedure TEditBaseForm2.StringGrid1SelectCell(Sender: TObject; ACol,
                                               ARow: Integer; var CanSelect: Boolean) ;
var
  i : integer ;
  f : single ;
begin
  inherited;
  f := 0;
  for i := 1 to 4 do
      begin
          if trim(StringGrid1.Cells[2,i]) <> '' then
              f := f + strtofloat(StringGrid1.Cells[2,i]) ;
      end ;

  //showmessage( StringGrid2.Cells[1,StringGrid2.RowCount-1]);
  if trim(StringGrid2.Cells[1,StringGrid2.RowCount-1]) <> '' then
      f := f + strtofloat(StringGrid2.Cells[1,StringGrid2.RowCount-1]) ;

  if DM.qwzpr85_1CURR_RATE.IsNull then
      begin
      end
  else
      begin
          edit11.Text := format('%.'+trim(combobox8.Text)+'f',[f/DM.qwzpr85_1CURR_RATE.Value]);//floattostr(f) ;
          if ComboBox7.Text <> '' then
              edit12.Text := format('%.'+trim(combobox8.Text)+'f',[f*(1+strtofloat(ComboBox7.Text)/100)/DM.qwzpr85_1CURR_RATE.Value])
          else
              edit12.Text := edit11.Text ;

          if strtointdef(MaskEdit4.Text,0) =0 then
              begin
                  if strtointdef(MaskEdit4.Text,0) <> 0 then
                      edit15.Text := format('%.'+trim(combobox8.Text)+'f',[f/strtoint(MaskEdit4.Text)/DM.qwzpr85_1CURR_RATE.Value])
                  else
                      edit15.Text := '0';
              end
          else
              edit15.Text := '0' ;

          if ComboBox7.Text <> '' then
              begin
                  if strtointdef(MaskEdit4.Text,0) <> 0 then
                       edit17.Text := format('%.'+trim(combobox8.Text)+'f',[f/strtoint(MaskEdit4.Text)*(1+strtofloat(ComboBox7.Text)/100)/DM.qwzpr85_1CURR_RATE.Value])
                  else
                       edit17.Text := '0';
              end
          else
              edit17.Text := edit15.Text ;
      end;

end;

procedure TEditBaseForm2.ComboBox7Change(Sender: TObject);
var
  i : integer ;
  f : single ;
begin
  inherited;
  if vsave01 then
      begin
          vsave0085 := true ;
          bitbtn2.Enabled :=True ;
          BitBtn8.Enabled := true ;
          f := 0;
          //新加，2007-4-9,基本加工费
          f := f + strtofloat(edit20.Text )*sumares ;
          f := f + summat ;
          for i := 1 to 4 do
              begin
                  if trim(StringGrid1.Cells[2,i]) <> '' then
                      f := f + strtofloat(StringGrid1.Cells[2,i]) ;
              end ;

          //showmessage( StringGrid2.Cells[1,StringGrid2.RowCount-1]);
          if trim(StringGrid2.Cells[1,StringGrid2.RowCount-1]) <> '' then
              f := f + strtofloat(StringGrid2.Cells[1,StringGrid2.RowCount-1]) ;

          if DM.qwzpr85_1CURR_RATE.IsNull then
              begin
              end
          else
              begin
                    edit11.Text := format('%.'+trim(combobox8.Text)+'f',[f/DM.qwzpr85_1CURR_RATE.Value]);//floattostr(f) ;
                    if ComboBox7.Text <> '' then
                        edit12.Text := format('%.'+trim(combobox8.Text)+'f',[f*(1+strtofloat(ComboBox7.Text)/100)/DM.qwzpr85_1CURR_RATE.Value])
                    else
                        edit12.Text := edit11.Text ;
                    if strtointdef(MaskEdit4.Text,0) <> 0 then
                        edit15.Text := format('%.'+trim(combobox8.Text)+'f',[f/strtoint(MaskEdit4.Text)/DM.qwzpr85_1CURR_RATE.Value])
                    else
                        edit15.Text := '0' ;

                    if ComboBox7.Text <> '' then
                        begin
                            if strtointdef(MaskEdit4.Text,0) <> 0 then
                               edit17.Text := format('%.'+trim(combobox8.Text)+'f',[f/strtoint(MaskEdit4.Text)*(1+strtofloat(ComboBox7.Text)/100)/DM.qwzpr85_1CURR_RATE.Value])
                            else
                               edit17.Text := '0';
                        end
                    else
                        edit17.Text := edit15.Text ;
              end;


      end ;
end;

procedure TEditBaseForm2.ComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //只能输入0..9的数字与一个小数点
  CheckMaskEditKeyPress(sender,key,1);
  IF ComboBox7.Text <> '' THEN
       BEGIN
           {IF LENGTH(ComboBox7.Text+Key) > 6 THEN
                 BEGIN
                    Key := #0 ;
                    SHOWMESSAGE('只能输入：三位数字＋小数点＋两位数字');
                 END
           ELSE {}
           IF TRUNC(StrToFloat(ComboBox7.Text+Key)) >= 1000 THEN
                 BEGIN
                    Key := #0;
                    SHOWMESSAGE('最多只能输入：三位数字＋小数点＋两位数字 的格式');
                 END ;
       END ;

end;

procedure TEditBaseForm2.FormCreate(Sender: TObject);
begin
  inherited;
  vsave01 := false ;
  ComboBox6Text2 := '';
  ENGR_ROUTE_PTR0085 := 0 ;
  summat := 0;
  basepriceptr := -1 ;
end;

procedure TEditBaseForm2.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  with StringGrid2 do
      begin              //and (ARow <> StringGrid2.RowCount-1)  
          if (ARow <> 0) and (ACol<>0) then
              begin
                  Canvas.Brush.Color := clGradientActiveCaption ;
                  Canvas.FillRect(Rect);
                  //showmessage(StringGrid1.Cells[aRow, aCol]);
                  Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid2.Cells[aCol,aRow]);
              end;
      end;   {}
end;

procedure TEditBaseForm2.StringGrid1Exit(Sender: TObject);
VAR
  B:BOOLEAN;
begin
  inherited;
  StringGrid1SelectCell(SENDER,StringGrid1.Col,StringGrid1.Row,B);
end;

procedure TEditBaseForm2.displaycheck5();
var
  i:integer;
begin
    //显示表85的内容

    edit1.Text := dm.DS85TNUMBER.Value ;
    MaskEdit2.Text := dm.DS85UNIT_LEN.AsString ; //交货长
    MaskEdit3.Text := dm.DS85UNIT_WTH.AsString ; //交货宽
    MaskEdit4.Text := dm.DS85qte_units.AsString ; //交货数量

    Edit9.Text := dm.DS85cust_rfq.AsString ;//参考号:
    Edit18.Text := dm.DS85cust_part_no.AsString ;//客户型号:
    if not dm.DS85ttype2.IsNull then  //报价类型:
         ComboBox1.ItemIndex := dm.DS85ttype2.AsInteger ;


    DateTimePicker1.DateTime := dm.DS85qte_date.AsDateTime  ;
    DateTimePicker3.DateTime := dm.DS85expiration_date.AsDateTime ;


    ComboBox11.ItemIndex :=  dm.DS85qte_unit_ptr.Value - 1 ;
    Label37.Caption := '  ' +  ComboBox11.Text + ' ' ;
    if dm.DS85qte_unit_ptr.IsNull then ComboBox11.ItemIndex := 0;

    edit14.Text  :=  dm.DS85tunits.AsString ;
    if dm.DS85tunits.IsNull then edit14.Text := '1' ;
    if edit14.Text ='0' then edit14.Text := '1' ;
    //Edit2.Text := dm.DS85
    Edit2.Text := dm.DS85cust_name.AsString ;//客户:
    Edit10.Text := dm.DS85cust_contact.AsString ;//联络人:
    Edit3.Text := dm.DS85cust_phone.AsString ;//电话号码:
    //Edit5.Text := dm.DS85 ;//销售代表:
    //Edit6.Text := dm.DS85 ;//币种:
    Edit4.Text := dm.DS85payment.AsString ;//结算方式:
    Edit7.Text := dm.DS85cust_fax.AsString ;//传真:
    Edit8.Text := dm.DS85EMAIL.AsString ;//E-mail:
    if not  dm.DS85QuoteType.IsNull then
        ComboBox9.ItemIndex := dm.DS85QuoteType.AsInteger ;


    if not dm.DS85srep_PTR.IsNull then
       with ADOQuery1 do
           begin
               if Active then Close;
               SQL.Clear ;
               SQL.Add('SELECT Data0009.SALES_REP_NAME'
                     +' FROM Data0009 '
                     +' where  Data0009.RKEY ='''+dm.DS85srep_PTR.AsString+'''');
               Prepared ;
               //SHOWMESSAGE(SQL.Text );
               Open ;
               IF NOT IsEmpty THEN
                   edit5.Text := FieldValues['SALES_REP_NAME'];
               CLOSE ;
           end ;

   if not dm.DS85curr_PTR.IsNull then
       with ADOQuery1 do
           begin
               if Active then Close;
               SQL.Clear ;
               SQL.Add('select CURR_NAME from data0001 where rkey  ='''+dm.DS85curr_PTR.AsString+'''');
               Prepared ;
               //SHOWMESSAGE(SQL.Text );
               Open ;
               IF NOT IsEmpty THEN
                   edit6.Text := FieldValues['CURR_NAME'];
               CLOSE ;
           end ;


    if not dm.DS85prod_code_ptr.IsNull then
       with ADOQuery1 do
           begin
               if Active then Close;
               SQL.Clear ;
               SQL.Add('select PRODUCT_NAME from data0008 where rkey  ='''+dm.DS85prod_code_ptr.AsString+'''');
               Prepared ;
               //SHOWMESSAGE(SQL.Text );
               Open ;
               IF NOT IsEmpty THEN
                   edit16.Text := FieldValues['PRODUCT_NAME'];
               CLOSE ;
           end ;

    if not dm.DS85cust_ptr.IsNull then
        begin
            with ADOQuery1 do
                 begin
                     if Active then Close;
                     SQL.Clear ;
                     SQL.Add('SELECT DISTINCT Data0189.STATE_TAX'
                              +' FROM Data0012 INNER JOIN'
                                    +' Data0189 ON Data0012.SHIP_CTAX_PTR = Data0189.RKEY'
                              +' WHERE Data0012.CUSTOMER_PTR = '+dm.DS85cust_ptr.AsString);
                     Prepared ;
                     //SHOWMESSAGE(SQL.Text );
                     Open ;
                     ComboBox7.Clear ;
                     IF NOT IsEmpty THEN
                         begin
                             while not eof do
                                 begin
                                     ComboBox7.Items.Add(floattostr(FieldValues['STATE_TAX']));
                                     next;
                                 end ;
                         end
                     else
                         begin
                             //ComboBox7.Items.Add('0');
                         end ;
                     CLOSE ;
                 end ;
        end
    else
        begin
             ComboBox7.Clear ;
             //ComboBox7.Items.Add('0');
             //ComboBox7.text := '0';
        end ;
    if not dm.DS85vatax.IsNull then
        begin
            ComboBox7.text := dm.DS85vatax.AsString ;
        end
    else
        ComboBox7.text := '0' ;




    if dm.qwzpr85_8.Active then dm.qwzpr85_8.Close ;
    if qwzpr85_10.Active then qwzpr85_10.Close ;
    if dm.qwzpr85_23.Active then dm.qwzpr85_23.Close ;


    //if vEditMode = 0 then
        begin
             //显示特别费用
             if not dm.qwzpr85_12.Active then dm.qwzpr85_12.Open ;
             dm.qwzpr85_12.First ;
             while not dm.qwzpr85_12.Eof do
                 begin
                      //ComboBox1.Items.Add(dm.DS852ADDER_NAME.Value);
                      ComboBox2.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                      ComboBox3.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                      ComboBox4.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                      ComboBox5.Items.Add(dm.qwzpr85_12ADDER_NAME.Value);
                      dm.qwzpr85_12.Next ;
                 end ;
             //处理要显示的特别费用
             if not (dm.qwzpr85_23.Active) then
                 begin
                     dm.qwzpr85_23.Parameters.ParamValues['@rkey085'] :=  dm.DS85RKEY.Value ;
                     dm.qwzpr85_23.Open ;
                 end ;
             ShowComboBox2_5check(ComboBox2,'1') ;
             ShowComboBox2_5check(ComboBox3,'2') ;
             ShowComboBox2_5check(ComboBox4,'3') ;
             ShowComboBox2_5check(ComboBox5,'4') ;

             //显示报价产品类别
             if not (dm.qwzpr85_22.Active) then dm.qwzpr85_22.open ;
             dm.qwzpr85_22.First ;
             while not dm.qwzpr85_22.Eof do
                 begin
                      ComboBox6.Items.Add(dm.qwzpr85_22row_name.Value);
                      dm.qwzpr85_22.Next ;
                 end ;

             {if dm.qwzpr85_21.Active then dm.qwzpr85_21.Close ;
             dm.qwzpr85_21.Parameters.ParamValues['@rkey085'] :=  dm.DS85RKEY.Value ;
             dm.qwzpr85_21.Prepared ;
             dm.qwzpr85_21.Open ;
             {}
             if not dm.DS85ENGR_ROUTE_PTR.IsNull then
                 if dm.qwzpr85_22.Locate('rkey',dm.DS85ENGR_ROUTE_PTR.Value,[]) then
                     begin
                         //showmessage(dm.qwzpr85_22row_name.Value);
                         for i := 0 to ComboBox6.Items.Count - 1 do
                             if  ComboBox6.Items[i] = dm.qwzpr85_22row_name.Value then
                                 begin
                                     ComboBox6.ItemIndex := i;
                                     break ;
                                 end;

                         //ComboBox6.Text := dm.qwzpr85_22row_name.Value ;
                         //showmessage(ComboBox6.Text);
                         //显示特别工艺
                         DisplayData00351check(vEditMode) ;

                     end ;
        end ;
    dm.PEditDATA0351 := true ;


    StringGrid1.Cells[0,0] := '项目' ;
    StringGrid1.Cells[1,0] := '计算参考值' ;
    StringGrid1.Cells[2,0] := '实际收取' ;

    //

    IF DM.qwzpr85_23.Locate('TYPEMARK',1,[]) THEN
        BEGIN
             StringGrid1.Cells[0,1] := ' 工程费 ' ;
             StringGrid1.Cells[1,1] := DM.qwzpr85_23free_amount.AsString ;
             StringGrid1.Cells[2,1] := DM.qwzpr85_23amount.AsString ;
        END ;
    IF DM.qwzpr85_23.Locate('TYPEMARK',2,[]) THEN
        BEGIN
             StringGrid1.Cells[0,2] := ' 制板费 ' ;
             StringGrid1.Cells[1,2] := DM.qwzpr85_23free_amount.AsString ;
             StringGrid1.Cells[2,2] := DM.qwzpr85_23amount.AsString ;
        END ;
    IF DM.qwzpr85_23.Locate('TYPEMARK',3,[]) THEN
        BEGIN
             StringGrid1.Cells[0,3] := ' 菲林费 ' ;
             StringGrid1.Cells[1,3] := DM.qwzpr85_23free_amount.AsString ;
             StringGrid1.Cells[2,3] := DM.qwzpr85_23amount.AsString ;
        END ;
    IF DM.qwzpr85_23.Locate('TYPEMARK',4,[]) THEN
        BEGIN
             StringGrid1.Cells[0,4] := ' 测试费 ' ;
             StringGrid1.Cells[1,4] := DM.qwzpr85_23free_amount.AsString ;
             StringGrid1.Cells[2,4] := DM.qwzpr85_23amount.AsString ;
        END ;
    CluckAREA() ;
    //显示最后的结果
    DisplyDatadata0432check ;

    vsave01 := true ;

    //if vEditMode = 3 then
        begin //将控件的属性改为不可编辑

             for i := 0 to ComponentCount - 1 do
                 begin
                     //tm2 := Components[i];
                     if (Components[i].Name <> 'BitBtn3') and (Components[i].Name <> 'BitBtn9') then
                         begin
                              if Components[i] is Tedit then
                                   (Components[i] as Tedit).Enabled := false
                              else if Components[i] is Tmaskedit then
                                   (Components[i] as Tmaskedit).Enabled := false
                              else if Components[i] is TComboBox then
                                   (Components[i] as TComboBox).Enabled := false
                              else if Components[i] is TDateTimePicker then
                                   (Components[i] as TDateTimePicker).Enabled := false
                              else if Components[i] is TBitBtn then
                                   (Components[i] as TBitBtn).Enabled := false
                              else if Components[i] is TDBGridEh then
                                   (Components[i] as TDBGridEh).Enabled := false
                              else if Components[i] is TStringGrid then
                                   (Components[i] as TStringGrid).Enabled := false
                              else if Components[i] is TDBEdit then
                                   (Components[i] as TDBEdit).Enabled := false
                              else if Components[i] is TDBMemo then
                                   (Components[i] as TDBMemo).Enabled := false ;
                         end ;
                 end;

        end ;
end;


function TEditBaseForm2.ShowComboBox2_5check(var sender:TComboBox;num:string): boolean;
var
  i : integer;
begin
    try
           if ADOQuery1.Active then ADOQuery1.Close;
           ADOQuery1.Parameters.Clear ;
           ADOQuery1.SQL.Clear ;
           ADOQuery1.SQL.Add('SELECT Data0348.ADDER_NAME '
                             +' FROM Data0432 INNER JOIN '
                                +' Data0348 ON Data0432.SOURCE_PTR = Data0348.RKEY '
                              +'WHERE (Data0348.TTYPE = 2) AND (Data0432.TypeMark = '+num+') AND '
                                +'(Data0432.QTE_PTR = '+dm.ds85RKEY.AsString+')');
           ADOQuery1.Prepared ;
           ADOQuery1.Open;
           if not ADOQuery1.IsEmpty then
               begin
                   //sender.Text := ADOQuery1.FieldValues['ADDER_NAME']
                   for i := 0 to  sender.Items.Count -1 do
                       begin
                            if sender.Items[i] = ADOQuery1.FieldValues['ADDER_NAME'] then
                                begin
                                    sender.ItemIndex := i;
                                    break;
                                end ;
                       end ;

               end
           else
               sender.ItemIndex := -1 ;
               //sender.Text := '';
           ADOQuery1.Close ;
           result := true ;
    except
         result := false;
    end ;
end;
function TEditBaseForm2.DisplayData00351check(CONST VALUE:INTEGER): boolean;
begin
    result := false ;
    //增加显示特别工艺内容
    if dm.qwzpr85_8.Active then dm.qwzpr85_8.Close ;
    dm.qwzpr85_8.Parameters.ParamValues['@RKEY346'] :=  dm.qwzpr85_22rkey.Value ;
    dm.qwzpr85_8.Prepared ;
    dm.qwzpr85_8.Open ;

    if not qwzpr85_10.Active then
         begin
              qwzpr85_10.Parameters.ParamValues['@RKEY085'] :=  dm.ds85rkey.value ;
              qwzpr85_10.Open ;
              IF AreaRkey <> 0 THEN
                  IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
                       BEGIN
                            qwzpr85_10.Append ;
                            qwzpr85_10QTE_PTR.Value := DM.ds85RKEY.Value ;
                            qwzpr85_10UNIT_PTR.Value := AreaRkey ;
                       END ;
              IF AreaRkey3 <> 0 THEN
                  IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey2,[]) THEN
                       BEGIN
                            qwzpr85_10.Append ;
                            qwzpr85_10QTE_PTR.Value := DM.ds85RKEY.Value ;
                            qwzpr85_10UNIT_PTR.Value := AreaRkey2 ;
                       END ;
              IF AreaRkey3 <> 0 THEN
                  IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey3,[]) THEN
                       BEGIN
                            qwzpr85_10.Append ;
                            qwzpr85_10QTE_PTR.Value := DM.ds85RKEY.Value ;
                            qwzpr85_10UNIT_PTR.Value := AreaRkey3 ;
                       END ;

         end ;

    IF VALUE =0 THEN //新增报价单
          begin
                 //增加报价的项目 ,将设置中为选中的项目写入到数据库的表中432
                 dm.qwzpr85_8.First ;
                 while not dm.qwzpr85_8.Eof do
                     begin
                         //新改，取消 if dm.qwzpr85_8DEFT_SELECTED.Value  then
                             begin
                                  dm.qwzpr85_23.Append  ;
                                  dm.qwzpr85_23SOURCE_PTR.Value := dm.qwzpr85_8D0348_PTR.Value ;
                                  dm.qwzpr85_23QTE_PTR.Value := dm.ds85rkey.Value ;
                                  //dm.qwzpr85_23AMOUNT.Value := NULL ;
                                  //dm.qwzpr85_23ADDL_CAT_PTR.Value := NULL ;
                                  dm.qwzpr85_23FREE_AMOUNT.Value := 0 ;
                                  dm.qwzpr85_23TAX_FLAG.Value := 'Y' ;
                                  //dm.qwzpr85_23TypeMark.Value := null ;
                                  AddQwzpr85_10check(dm.qwzpr85_8D0348_PTR.Value);
                             end;
                         dm.qwzpr85_8.Next ;
                     end;
          end
    else IF VALUE = 1 THEN //编辑报价单
        begin  //检查设置的值在表432中,如果存在就为选中否则为不选中
            dm.qwzpr85_8.First ;
            while not dm.qwzpr85_8.Eof do
                begin
                     if dm.qwzpr85_23.Locate('SOURCE_PTR',dm.qwzpr85_8D0348_PTR.Value ,[]) then
                         begin  //如果值为假时改为真
                              if not(dm.qwzpr85_8DEFT_SELECTED.Value) then
                                  begin
                                       dm.qwzpr85_8.Edit ;
                                       dm.qwzpr85_8DEFT_SELECTED.Value := true;
                                  end ;
                         end
                     else
                         begin  //如果值为真时改为假
                              if dm.qwzpr85_8DEFT_SELECTED.Value then
                                  begin
                                       dm.qwzpr85_8.Edit ;
                                       dm.qwzpr85_8DEFT_SELECTED.Value := false;
                                  end ;
                         end ;

                     dm.qwzpr85_8.Next ;
                end;
        end;
    dm.qwzpr85_8.First;
    result := true ;
end;

function TEditBaseForm2.AddQwzpr85_10check(CONST VALUE :INTEGER): boolean;
begin //向实际用到的参数表中增加要用的参数
  try
      with ADOStoredProc1 do
          begin
             Parameters.Clear ;
             ProcedureName := 'Qwzpr85;9';
             Parameters.CreateParameter('@RETURN_VALUE',ftinteger,pdReturnValue,0,0) ;
             Parameters.CreateParameter('@RKEY348',ftstring,pdInput,20,0);
             Parameters.ParamValues['@RETURN_VALUE'] := 0 ;
             Parameters.ParamValues['@RKEY348'] :=  VALUE ;//dm.qwzpr85_8D0348_PTR.Value ;
             prepared;
             Open ;
             if not IsEmpty then
                 begin
                     //增加要加的参数,不在qwzpr85_10中则增加进去
                     if not qwzpr85_10.Active then
                         begin
                              qwzpr85_10.Parameters.ParamValues['@RKEY085'] :=  dm.ds85rkey.value ;
                              qwzpr85_10.Open ;
                              IF NOT qwzpr85_10.Locate('UNIT_PTR',AreaRkey,[]) THEN
                                   BEGIN
                                        qwzpr85_10.Append ;
                                        qwzpr85_10QTE_PTR.Value := DM.ds85RKEY.Value ;
                                        qwzpr85_10UNIT_PTR.Value := AreaRkey ;
                                   END ;

                         end ;
                     while not eof do
                         begin
                             if not(qwzpr85_10.Locate('unit_ptr',ADOStoredProc1.FieldValues['UNIT_PTR'],[])) then
                                 begin
                                      qwzpr85_10.Append ;
                                      qwzpr85_10QTE_PTR.Value := dm.ds85rkey.value ;
                                      qwzpr85_10UNIT_PTR.Value := ADOStoredProc1.FieldValues['UNIT_PTR'];
                                      qwzpr85_10UNIT_VALUE.Value := '';
                                 end ;
                             next ;
                         end ;
                 end ;
             close ;
          end ;
      result := true ;
  except
      result := false;
  end ;

end;

function TEditBaseForm2.DisplyDatadata0432check: boolean;
var
  i:integer;
  v2,v3,v4: single;
begin
  inherited;
  result := false ;
  i := 1;  v2 := 0 ;
  if dm.qwzpr85_29.Active then dm.qwzpr85_29.Close ;
  dm.qwzpr85_29.Prepared ;
  dm.qwzpr85_29.Open;
  StringGrid2.RowCount := 2 ;
  dm.qwzpr85_23.First ;
  while not dm.qwzpr85_23.Eof do
      begin
           if not dm.qwzpr85_23typemark.IsNull then
               begin
                   if not (dm.qwzpr85_23typemark.Value in [1,2,3,4]) then
                       begin
                            StringGrid2.RowCount := StringGrid2.RowCount + 1 ;
                            if dm.qwzpr85_29.Locate('rkey',dm.qwzpr85_23source_ptr.Value,[]) then
                                  StringGrid2.Cells[0,i] := dm.qwzpr85_29adder_name.AsString  ;
                            StringGrid2.Cells[1,i] := dm.qwzpr85_23free_amount.AsString ;
                            v2 :=v2+ dm.qwzpr85_23free_amount.Value ;
                            i := i + 1 ;
                       end ;
               end
           else
                   begin
                        StringGrid2.RowCount := StringGrid2.RowCount + 1 ;
                        if dm.qwzpr85_29.Locate('rkey',dm.qwzpr85_23source_ptr.Value,[]) then
                                  StringGrid2.Cells[0,i] := dm.qwzpr85_29adder_name.AsString ;
                        StringGrid2.Cells[1,i] := dm.qwzpr85_23free_amount.AsString ;
                        v2 :=v2+ dm.qwzpr85_23free_amount.Value ;
                        i := i + 1 ;
                   end ;
           dm.qwzpr85_23.Next ;
      end ;
  dm.qwzpr85_29.Close ;
  StringGrid2.Cells[0,i] := '合计' ;
  StringGrid2.Cells[1,i] := floattostr(v2) ;
 //清除以前的数据
 for i := 1 to 4 do
     begin
           StringGrid1.Cells[0,i] := '' ;
           StringGrid1.Cells[1,i] := '' ;
           StringGrid1.Cells[2,i] := '' ;
           StringGrid1.Cells[3,i] := '' ;
     end ;

 IF DM.qwzpr85_23.Locate('TYPEMARK',1,[]) THEN
      BEGIN
           StringGrid1.Cells[0,1] := ' 工程费 ' ;
           StringGrid1.Cells[1,1] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,1] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,1] := '1';
      END ;
  IF DM.qwzpr85_23.Locate('TYPEMARK',2,[]) THEN
      BEGIN
           StringGrid1.Cells[0,2] := ' 制板费 ' ;
           StringGrid1.Cells[1,2] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,2] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,2] := '1' ;
      END ;
  IF DM.qwzpr85_23.Locate('TYPEMARK',3,[]) THEN
      BEGIN
           StringGrid1.Cells[0,3] := ' 菲林费 ' ;
           StringGrid1.Cells[1,3] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,3] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,3] := '1' ;
      END ;
  IF DM.qwzpr85_23.Locate('TYPEMARK',4,[]) THEN
      BEGIN
           StringGrid1.Cells[0,4] := ' 测试费 ' ;
           StringGrid1.Cells[1,4] := DM.qwzpr85_23free_amount.AsString ;
           StringGrid1.Cells[2,4] := DM.qwzpr85_23amount.AsString ;
           StringGrid1.Cells[3,4] := '1' ;
      END ;

  v3 := v2 ; v4 := v2 ;
  for i := 1 to StringGrid1.RowCount - 1 do
      begin
           if trim(StringGrid1.Cells[1,i]) <> '' then
               v3 := v3 + strtofloat(StringGrid1.Cells[1,i]) ;
           if trim(StringGrid1.Cells[2,i]) <> '' then
               v4 := v4 + strtofloat(StringGrid1.Cells[2,i]) ;
      end ;
  Label30.Caption := floattostr(v3) ;
  // 除汇率得到原币　DM.qwzpr85_1CURR_RATE
  if DM.ds85CURR_RATE.IsNull then
      begin
         //showmessage('null');
      end
  else
      begin
          //showmessage(DM.qwzpr85_1CURR_RATE.AsString);
          edit11.Text := format('%.'+trim(combobox8.Text)+'f',[v4/DM.ds85CURR_RATE.Value]);//) ;  ///DM.qwzpr85_1CURR_RATE.Value
          if ComboBox7.Text <> '' then
              edit12.Text := format('%.'+trim(combobox8.Text)+'f',[v4*(1+strtofloat(ComboBox7.Text)/100)/DM.ds85CURR_RATE.Value])  ///DM.qwzpr85_1CURR_RATE.Value
          else
              edit12.Text := edit11.Text ;
          if MaskEdit4.Text <> '0' then
             edit15.Text := format('%.'+trim(combobox8.Text)+'f',[v4/strtoint(MaskEdit4.Text)/DM.ds85CURR_RATE.Value]) ///DM.qwzpr85_1CURR_RATE.Value
          else
              edit15.Text := format('%.'+trim(combobox8.Text)+'f',[0.0]) ;
          if ComboBox7.Text <> '' then
              begin
                  if MaskEdit4.Text <> '0' then
                      edit17.Text := format('%.'+trim(combobox8.Text)+'f',[v4/strtoint(MaskEdit4.Text)*(1+strtofloat(ComboBox7.Text)/100)/DM.ds85CURR_RATE.Value]) ///DM.qwzpr85_1CURR_RATE.Value
                  else
                       edit17.Text := format('%.'+trim(combobox8.Text)+'f',[0.0]);
              end
          else
              edit17.Text := edit15.Text ;
      end;
  result := true ;
end;


procedure TEditBaseForm2.BitBtn15Click(Sender: TObject);
begin
  inherited;
  FindData0006Form2:= TFindData0006Form2.Create(application) ;
  try
      FindData0006Form2.Caption := '查找产品类别' ;
      FindData0006Form2.ADOQuery1.Prepared ;
      FindData0006Form2.ADOQuery1.Open ;
      if FindData0006Form2.ShowModal = mrok then
          begin
              BitBtn2.Enabled := TRUE ;
              vsave0085 := true ;
              ComboBox12.Text :=FindData0006Form2.ADOQuery1QTE_APPROV_DESC.Value ;//FrmProdcode.adoquery1.fieldbyname('product_name').asstring;
              vPROD_ROUTE_PTR := FindData0006Form2.ADOQuery1RKEY.Value ;
          end ;
  finally
      IF FindData0006Form2.ADOQuery1.Active THEN FindData0006Form2.ADOQuery1.Close ;
      FindData0006Form2.Free;
  end ;
end;

function TEditBaseForm2.Get_RkeyData0085: integer;
begin
  result := vRkeyData0085;
end;

procedure TEditBaseForm2.Set_RkeyData0085(const Value: integer);
begin
  vRkeyData0085 := Value ;
end;

procedure TEditBaseForm2.addQNumber_1(const VALUE: INTEGER);
var
  oldvseed2,vseed2:string ;
  //EditBaseForm2: TEditBaseForm2 ;
begin
  if not dm.qwzpr85_1.Active then exit ;
  //向数据库中增加一条记录
  dm.ADODate.Close ;
  dm.ADODate.Open ;

  if dm.ado04.Active then dm.ado04.Close ;
  dm.ado04.Open ;
  vseed2 := dm.ado04SEED_VALUE.Value ;
  dm.ado04.Close;
  if dm.qwzpr85_2.Active then dm.qwzpr85_2.Close;
  if dm.qwzpr85_3.Active then dm.qwzpr85_3.Close;
  if dm.qwzpr85_4.Active then dm.qwzpr85_4.Close;
  if dm.qwzpr85_5.Active then dm.qwzpr85_5.Close;
  if dm.qwzpr85_6.Active then dm.qwzpr85_6.Close;
  dm.qwzpr85_1.Append ;
  dm.qwzpr85_1TNUMBER.Value := vseed2 ;
  dm.qwzpr85_1TTYPE.Value := VALUE ;
  dm.qwzpr85_1ENTER_DATE.Value := dm.ADODate.FieldValues['vdt'];

  dm.qwzpr85_1QBY_EMPL_PTR.Value := strtoint(user_ptrs) ;
  dm.qwzpr85_1ref_part_no.Value := '';
  dm.qwzpr85_1CUST_PART_NO.Value := '';
  dm.qwzpr85_1CUST_NAME.Value := '';
  DM.qwzpr85_1AUDITED_STATUS.Value := 0 ;

  //dm.qwzpr85_1.UpdateBatch();
  //dm.qwzpr85_1.Refresh ;

  update_04(vseed2);
  //dm.ADOConnection1.CommitTrans ;

end ;

procedure TEditBaseForm2.update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  v_length := length(v_seed);
  if dm.ado04.Active then dm.ado04.Close ;
  dm.ado04.Open ;

  for i := v_length downto 1 do
      if not (v_seed[i] in ['0'..'9']) then
           begin
                v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1);
                new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);

                dm.ado04.Edit;
                dm.ado04SEED_VALUE.Value := new_seed;

                dm.ado04.Post;

                break;
           end
      else
           if i=1 then
              begin
                 v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
                 new_seed := copy(v_last,2,v_length);

                 dm.ado04.Edit;
                 dm.ado04SEED_VALUE.Value := new_seed;

                 dm.ado04.Post;

              end;
  dm.ado04.Close ;
end;
procedure TEditBaseForm2.qwzpr85_10CalcFields(DataSet: TDataSet);
begin
  inherited;
  if qwzpr85_10.Active then
      begin
           if  self.qwzpr85_10MyDATA_TYPE.Value = 1 then
                self.qwzpr85_10MyDataType.Value := '数字'
           else if  self.qwzpr85_10MyDATA_TYPE.Value = 2 then
                self.qwzpr85_10MyDataType.Value := '字符' ;

            if not(dm.Qwzpr85_31.Active) then dm.Qwzpr85_31.Open ;
            if dm.Qwzpr85_31.Locate('rkey',self.qwzpr85_10Unit_ptr0002.Value,[]) then
                begin
                
                    self.qwzpr85_10MyUnit.Value := dm.Qwzpr85_31myunit.value ;
                end ;

      end ;
end;

procedure TEditBaseForm2.PopupMenu1Popup(Sender: TObject);
begin
  inherited;

  if (vEditMode = 0) or (vEditMode = 1) then
      begin
          MyPopupN1.Enabled := true ;
          MyPopupn2.Enabled := true ;
      end ;
end;

procedure TEditBaseForm2.MyPopupN1Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  FindData0348Form2:= TFindData0348Form2.Create(application) ;
  try
      FindData0348Form2.ADOStoredProc1.Open ;
      if FindData0348Form2.ShowModal = mrok then
          begin
              i := FindData0348Form2.ADOStoredProc1RKEY.Value ;
              if not(dm.qwzpr85_23.Locate('source_ptr',i,[])) then
                   begin
                       //
                       dm.qwzpr85_23.Append ;
                       dm.qwzpr85_23QTE_PTR.Value := vRkeyData0085;
                       dm.qwzpr85_23SOURCE_PTR.Value := i ;
                       dm.qwzpr85_23AMOUNT.Value := 0 ;
                       //dm.qwzpr85_23ADDL_CAT_PTR.Value := ;
                       dm.qwzpr85_23FREE_AMOUNT.Value := 0 ;
                       dm.qwzpr85_23TAX_FLAG.Value := 'Y';
                       dm.qwzpr85_23TypeMark.AsVariant := null;
                       //新增新参数
                       AddQwzpr85_10(i);
                       //dm.qwzpr85_23.Refresh ;
                       //self.qwzpr85_10.Refresh ;
                       BitBtn8.Enabled := true ;
                       BitBtn2.Enabled := true ;
                   end ;
          end ;
  finally
      FindData0348Form2.Free ;
  end ;
end;

procedure TEditBaseForm2.MyPopupN2Click(Sender: TObject);
begin
  inherited;
  IF dm.qwzpr85_23.Active THEN
      IF NOT(dm.qwzpr85_23.IsEmpty) THEN
          BEGIN
              //删除不用的参数
              DeleteQwzpr85_10(dm.qwzpr85_23SOURCE_PTR.Value,true);
              //删除特别项目
              dm.qwzpr85_23.Delete ;
              BitBtn8.Enabled := true ;
              BitBtn2.Enabled := true ;
          END;
end;

procedure TEditBaseForm2.N2Click(Sender: TObject);
var
  i,j:integer;
begin
  inherited;
   if dm.qwzpr85_33.Active then
       begin
            //showmessage(StringGrid3.Cells[0,StringGrid3.Row]);
            if  StringGrid3.Cells[0,StringGrid3.Row] <> '' then
                begin
                    if dm.qwzpr85_33.Locate('D0028_PTR',StringGrid3.Cells[0,StringGrid3.Row],[]) then
                         begin
                             dm.qwzpr85_33.Delete;
                             vsave0085 := true ;
                             bitbtn2.Enabled :=True ;
                             BitBtn8.Enabled := true ;
                             //处理显示的内容
                             for i := StringGrid3.Row to  StringGrid3.RowCount-1 do
                                  for j := 0 to StringGrid3.ColCount-1 do
                                      StringGrid3.Cells[j,i] := StringGrid3.Cells[j,i+1];
                             StringGrid3.RowCount := StringGrid3.RowCount - 1 ;
                         end ;
                end ;

       end ;
       {if not(dm.qwzpr85_33.IsEmpty) then
           begin
               dm.qwzpr85_33.Delete;
               vsave0085 := true ;
               bitbtn2.Enabled :=True ;
               BitBtn8.Enabled := true ;
           end ;  {}
end;

procedure TEditBaseForm2.N1Click(Sender: TObject);
var
  ni:integer;
begin
  inherited;
  if dm.qwzpr85_33.Active then
      //if not(dm.qwzpr85_33.IsEmpty) then
      begin
           FindMatPriceForm2 := TFindMatPriceForm2.Create(application) ;
           FindMatPriceForm2.ADOStoredProc1.Open ;
           try
                if FindMatPriceForm2.ShowModal = mrok then
                    begin
                        dm.qwzpr85_33.Append ;
                        dm.qwzpr85_33QUOTE_PTR.Value := dm.qwzpr85_1rkey.Value ;
                        dm.qwzpr85_33STD_INVENT_PTR.Value := FindMatPriceForm2.ADOStoredProc1d0017_rkey.Value ;
                        dm.qwzpr85_33QTY.Value := 0 ;
                        dm.qwzpr85_33price.Value := FindMatPriceForm2.ADOStoredProc1price2.Value ;
                        dm.qwzpr85_33D0028_PTR.Value := FindMatPriceForm2.ADOStoredProc1RKEY.Value ;
                        dm.qwzpr85_33D0028_PRICE.Value := FindMatPriceForm2.ADOStoredProc1qte_price2.Value ;

                        dm.qwzpr85_33MyINV_PART_NUMBER.Value := FindMatPriceForm2.ADOStoredProc1INV_PART_NUMBER.Value ;
                        dm.qwzpr85_33MyINV_PART_DESCRIPTION.Value := FindMatPriceForm2.ADOStoredProc1INV_DESCRIPTION.Value ;
                        vsave0085 := true ;
                        bitbtn2.Enabled :=True ;
                        BitBtn8.Enabled := true ;

                        ni := StringGrid3.RowCount - 1 ;
                        StringGrid3.RowCount := StringGrid3.RowCount + 1;

                        StringGrid3.Cells[0,ni] := FindMatPriceForm2.ADOStoredProc1RKEY.AsString  ;
                        StringGrid3.Cells[1,ni] := FindMatPriceForm2.ADOStoredProc1INV_PART_NUMBER.AsString ;
                        StringGrid3.Cells[2,ni] := FindMatPriceForm2.ADOStoredProc1INV_DESCRIPTION.AsString ;
                        StringGrid3.Cells[3,ni] := FindMatPriceForm2.ADOStoredProc1price2.AsString ;




                    end ;
           finally
                FindMatPriceForm2.ADOStoredProc1.Close;
                FindMatPriceForm2.Free ;
           end ;
      end ;
end;

procedure TEditBaseForm2.MaskEdit2Exit(Sender: TObject);
begin
  inherited;
  CluckAREA() ;
end;

procedure TEditBaseForm2.MaskEdit3Exit(Sender: TObject);
begin
  inherited;
  CluckAREA() ;
end;

procedure TEditBaseForm2.MaskEdit4Exit(Sender: TObject);
begin
  inherited;
  CluckAREA() ;
end;

procedure TEditBaseForm2.ComboBox13Change(Sender: TObject);
begin
  inherited;
  if vsave01 then
      begin
          bitbtn2.Enabled :=True;
          BitBtn8.Enabled := true ;
      end ;
  if dm.qwzpr85_23.Active then
      ChangeComboBox13(ComboBox13);

end;

procedure TEditBaseForm2.BitBtn16Click(Sender: TObject);
begin
  inherited;
  basepriceptr := -1 ;
  if vedit20Text <> '' then
     edit20.Text := vedit20Text;
  combobox13.ItemIndex := -1 ;
end;

function TEditBaseForm2.ShowComboBox13(var sender: TComboBox;
  num: string): boolean;
var
  i : integer;
begin
    try
           if ADOQuery1.Active then ADOQuery1.Close;
           ADOQuery1.Parameters.Clear ;
           ADOQuery1.SQL.Clear ;
           ADOQuery1.SQL.Add('SELECT Data0348.ADDER_NAME from data0348 where rkey ='+num);
                             //+' FROM Data0432 INNER JOIN '
                             //   +' Data0348 ON Data0432.SOURCE_PTR = Data0348.RKEY '
                             // +'WHERE  (Data0348.rkey = '+num+') AND '
                              //  +' (Data0432.QTE_PTR = '+dm.qwzpr85_1RKEY.AsString+')');
           ADOQuery1.Prepared ;
           ADOQuery1.Open;
           if not ADOQuery1.IsEmpty then
               begin
                   //sender.Text := ADOQuery1.FieldValues['ADDER_NAME']
                   for i := 0 to  sender.Items.Count -1 do
                       begin
                            if sender.Items[i] = ADOQuery1.FieldValues['ADDER_NAME'] then
                                begin
                                    sender.ItemIndex := i;
                                    break;
                                end ;
                       end ;

               end 
           else
               sender.ItemIndex := -1 ;
               //sender.Text := '';
           ADOQuery1.Close ;
           result := true ;
    except
         result := false;
    end ;
end;

function TEditBaseForm2.ChangeComboBox13(var sender: TComboBox): boolean;
VAR
  NNN:INTEGER;
  numb:integer;
  revalue,minrevalue,maxrevalue:single;
begin
   try
      if dm.qwzpr85_23.Locate('SOURCE_PTR',inttostr(basepriceptr),[]) then
          begin
               if  sender.Text = '' then
                   begin //删除不用的值
                       //删除旧的参数

                       DeleteQwzpr85_10(dm.qwzpr85_23source_ptr.Value,true);
                       dm.qwzpr85_23.Delete ;

                   end
               else
                   begin //更改新的值
                         numb := basepriceptr ;
                         basepriceptr := -1 ;

                         //找出对应的348中的值
                         if ADOQuery3.Active then ADOQuery3.Close;
                         ADOQuery3.Parameters.Clear ;
                         ADOQuery3.SQL.Clear ;
                         ADOQuery3.SQL.Add('SELECT rkey,FORMULA,Pcents,MIN_VALUE,MAX_VALUE '
                                           +' FROM Data0348  '
                                            +'WHERE (Data0348. ADDER_NAME= '''+sender.Text+''')');
                         ADOQuery3.Prepared ;
                         ADOQuery3.Open;

                         if not ADOQuery3.IsEmpty then
                             begin
                                  //SHOWMESSAGE(INTTOSTR(ADOQuery3.FieldValues['rkey']));
                                  revalue := 0;
                                  minrevalue := 0;
                                  maxrevalue := 0;
                                  //新增参数
                                  AddQwzpr85_10(ADOQuery3.FieldValues['rkey']);
                                  if not(ADOQuery3.FieldByName('FORMULA').IsNull) then
                                      if trim(ADOQuery3.FieldValues['FORMULA']) <> '' then
                                          ExceptFORMULA22(ADOQuery3.FieldValues['FORMULA'],ADOQuery3.FieldValues['Pcents'],revalue);
                                  if not(ADOQuery3.FieldByName('MIN_VALUE').IsNull) then
                                      if trim(ADOQuery3.FieldValues['MIN_VALUE']) <> '' then
                                          ExceptFORMULA22(ADOQuery3.FieldValues['MIN_VALUE'],ADOQuery3.FieldValues['Pcents'],minrevalue);
                                  if not(ADOQuery3.FieldByName('MAX_VALUE').IsNull) then
                                      if trim(ADOQuery3.FieldValues['MAX_VALUE']) <> '' then
                                           ExceptFORMULA22(ADOQuery3.FieldValues['MAX_VALUE'],ADOQuery3.FieldValues['Pcents'],maxrevalue);
                                  if revalue < minrevalue then revalue := minrevalue;
                                  if (revalue > maxrevalue) and (maxrevalue>0) then revalue := maxrevalue;

                                  if revalue <> 0 then edit20.Text := floattostr(revalue);
                                  basepriceptr :=  ADOQuery3.FieldValues['rkey'] ;

                                  {//SHOWMESSAGE(INTTOSTR(dm.qwzpr85_23SOURCE_PTR.Value));

                                  //删除旧的参数
                                  DeleteQwzpr85_10(dm.qwzpr85_23source_ptr.Value,true);

                                  dm.qwzpr85_23.Edit ;

                                  dm.qwzpr85_23SOURCE_PTR.Value := NNN;//ADOQuery3.FieldValues['rkey'];
                                  //新增参数
                                  AddQwzpr85_10(NNN);//ADOQuery3.FieldValues['rkey'] );  {}
                             end ;
                         ADOQuery3.Close ;

                   end ;
          end
      else
          begin
               if  sender.Text <> '' then
                   begin
                         numb := basepriceptr ;
                         basepriceptr := -1 ;
                         //找出对应的348中的值
                         if ADOQuery3.Active then ADOQuery3.Close;
                         ADOQuery3.Parameters.Clear ;
                         ADOQuery3.SQL.Clear ;
                         ADOQuery3.SQL.Add('SELECT rkey,FORMULA,Pcents,MIN_VALUE,MAX_VALUE  '
                                            +' FROM Data0348  '
                                            +'WHERE (Data0348. ADDER_NAME= '''+sender.Text+''')') ;
                         ADOQuery3.Prepared ;
                         //SHOWMESSAGE(ADOQuery3.SQL.Text );
                         ADOQuery3.Open ;
                         if not ADOQuery3.IsEmpty then
                             begin
                                  //新增参数
                                  AddQwzpr85_10(ADOQuery3.FieldValues['rkey']);
                                  revalue := 0 ;
                                  minrevalue := 0 ;
                                  maxrevalue := 0 ;
                                  if not(ADOQuery3.FieldByName('FORMULA').IsNull) then
                                      if trim(ADOQuery3.FieldValues['FORMULA']) <> '' then
                                          ExceptFORMULA22(ADOQuery3.FieldValues['FORMULA'],ADOQuery3.FieldValues['Pcents'],revalue);
                                  if not(ADOQuery3.FieldByName('MIN_VALUE').IsNull) then
                                      if trim(ADOQuery3.FieldValues['MIN_VALUE']) <> '' then
                                          ExceptFORMULA22(ADOQuery3.FieldValues['MIN_VALUE'],ADOQuery3.FieldValues['Pcents'],minrevalue);
                                  if not(ADOQuery3.FieldByName('MAX_VALUE').IsNull) then
                                      if trim(ADOQuery3.FieldValues['MAX_VALUE']) <> '' then
                                          ExceptFORMULA22(ADOQuery3.FieldValues['MAX_VALUE'],ADOQuery3.FieldValues['Pcents'],maxrevalue);
                                  if revalue < minrevalue then revalue := minrevalue;
                                  if (revalue > maxrevalue) and (maxrevalue>0) then revalue := maxrevalue;

                                  if revalue <> 0 then edit20.Text := floattostr(revalue);
                                  basepriceptr :=  ADOQuery3.FieldValues['rkey'] ;
                                  {dm.qwzpr85_23.Append  ;
                                  dm.qwzpr85_23SOURCE_PTR.Value := ADOQuery3.FieldValues['rkey'] ;
                                  dm.qwzpr85_23QTE_PTR.Value := vRkeyData0085;//dm.qwzpr85_1rkey.Value ;
                                  dm.qwzpr85_23AMOUNT.Value := 0 ;
                                  dm.qwzpr85_23ADDL_CAT_PTR.AsVariant := NULL ;
                                  dm.qwzpr85_23FREE_AMOUNT.Value := 0 ;
                                  dm.qwzpr85_23TAX_FLAG.Value := 'Y' ;
                                  dm.qwzpr85_23TypeMark.Value := strtoint(num) ;
                                  //新增参数
                                  AddQwzpr85_10(ADOQuery3.FieldValues['rkey'] );  {}

                             end ;
                         ADOQuery3.Close ;
                         //basepriceptr :=  num ;
                   end;
          end ;
       result := true ;
   except
        on e: exception do
            begin
                result := false ;
                //showmessage('保存出错');
                messagedlg(e.Message,mtwarning,[mbcancel],0);
            end ;

   end;
end;

function TEditBaseForm2.ExceptFORMULA22(const s1:string;const Pcentsv:integer; var value:single ):boolean;
var
  s,s2 :string ;
begin

  s2 := s1 ;//ADOStoredProc1.FieldValues['FORMULA'];
  s := ClackFORMULA(s2);
  //showmessage(s);
  with ADOQuery1 do
      begin
           if Active then Close;
           Parameters.Clear ;
           SQL.Clear ;
           SQL.Add('SELECT '+s+' as aaa');
           Prepared ;
           TRY
               Open;
           EXCEPT
               CLOSE ;
               SHOWMESSAGE('公式不正确!');
               EXIT ;
           END ;
           if not IsEmpty then
               begin
                   //showmessage(FieldValues['aaa']) ;
                   if Pcentsv = 0 then  // ADOStoredProc1.FieldValues['Pcents']
                       value := FieldValues['aaa']
                   else if Pcentsv = 1 then
                       begin
                       end
                   else if Pcentsv = 2 then
                       begin
                       end
                   else if Pcentsv = 3 then
                       begin
                           value := FieldValues['aaa']*strtofloat(edit20.Text) * sumares;
                       end ;
               end ;
           close;
      end ;
end ;

end.
