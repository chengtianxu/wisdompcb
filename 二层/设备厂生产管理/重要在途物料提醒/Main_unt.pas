unit Main_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzPanel, RzButton, ExtCtrls, ImgList, Grids, DBGridEh,
  StdCtrls, DB, ADODB, Buttons, Mask, RzEdit, RzBtnEdt, ButtonEdit,
  RzSpnEdt, DBCtrls,Contnrs,RzRadChk, DBCtrlsEh,StrUtils,DBGridEhImpExp;
                         //
type
  TDropDownInfo=class
  public
    L_SourceDataSet          :TDataSet; //在这个数据集上发生改变事件
    L_GridName               :TDBGridEh;     //添加下拉列表将创建在哪个表格名上,可以不赋值。
    L_DropdownColumn         :string;        //该属性在2个地方用到，1查找窗体在这行上建下拉列表;2在这个表格列上添加下拉列表
    L_ListDataSet            :TDataSet;      //录入界面表格下拉列表数据集名，可为空，
    L_FindDataSet            :TDataSet;      //查找窗口用到的下拉列表数据集名，可以和下拉列表数据集不同,能为空,如果为空，将和L_ListDataSetName共用，如果L_ListDataSet为空，该弹出窗体只出现在查找对话框中
    L_ListSQL                :string;         //如果不设置数据集，执行这里的SQL语句
    L_FindSQL                :string;         //如果不设置数据集，执行这里的SQL语句
    L_ColsInfo               :string;         //弹出窗体各列设置宽度
    L_ColsWidth              :Integer;        //列总宽度，内部调用
    L_ListDataSetFilterField :string;        //下拉列表数据集过滤字段名，//
    L_GetValueField          :string;        //获取值的字段名
    L_ListResultField        :string;        //下拉列表数据集返回的字段名 //当改变事件发生时，和该值进行定位
    L_FormWidth              :Integer;       //下拉窗体的宽度
    L_FormHeight             :Integer;       //下拉窗体的高度
    L_FormType               :Integer;       //下拉窗体的类型 1:单选窗口，2：多选窗口
    L_AddPickList            :array of string;//将字符串数组添加到表格的PickList中
    L_PickListResultValues   :array of string;//表格的PickList中返回的值
    L_SourceField            :array of string;//改变发生后，获取值的字段
    L_ResultField            :array of string;//改变发生后，从这些字段获取值
    L_FieldNotNull           :Boolean;        //如果设置为真，在L_DropdownColumn字段的值为空时，提示
  end;

type
  TForm1 = class(TForm)
    Images: TImageList;
    RzToolbar1: TRzToolbar;
    tblAdd: TRzToolButton;
    tblEdit: TRzToolButton;
    tblSave: TRzToolButton;
    tblCancel: TRzToolButton;
    tblDelete: TRzToolButton;
    RzSpacer1: TRzSpacer;
    tblRefresh: TRzToolButton;
    tblfind: TRzToolButton;
    tblExport: TRzToolButton;
    tblFilter: TRzToolButton;
    tblCancelFilter: TRzToolButton;
    tblPrint: TRzToolButton;
    tblDesign: TRzToolButton;
    RzSpacer2: TRzSpacer;
    tblFirst: TRzToolButton;
    tblPrior: TRzToolButton;
    tblNext: TRzToolButton;
    tblLast: TRzToolButton;
    StatusBar1: TStatusBar;
    Panel_right: TPanel;
    Panel_Left: TPanel;
    Panel_Main: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    RzToolbar2: TRzToolbar;
    btn1: TButton;
    Panel2: TPanel;
    PageControl_M: TPageControl;
    TabSheet1: TTabSheet;
    DghMain: TDBGridEh;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    Panel_Bottom: TPanel;
    DataSource1: TDataSource;
    dtMain: TADODataSet;
    ADOConnection1: TADOConnection;
    Timer1: TTimer;
    Timer2: TTimer;
    dtMainDSDesigner: TStringField;
    dtMainDSDesigner2: TStringField;
    dtMainDSDesigner3: TStringField;
    dtMainDSDesigner4: TBCDField;
    dtMainDSDesigner5: TBCDField;
    dtMainDSDesigner6: TBCDField;
    dtMainDSDesigner7: TDateTimeField;
    dtMainDSDesigner8: TStringField;
    dtMainDSDesigner9: TStringField;
    dtMainDSDesigner10: TStringField;
    dtMainDSDesigner11: TStringField;
    dtMainDSDesigner12: TStringField;
    dtMainDSDesigner13: TStringField;
    qry0034: TADOQuery;
    qry0005: TADOQuery;
    qry0005RKEY: TIntegerField;
    qry0005EMPL_CODE: TStringField;
    qry0005EMPLOYEE_NAME: TStringField;
    qry0034RKEY: TIntegerField;
    qry0034DEPT_CODE: TStringField;
    qry0034DEPT_NAME: TStringField;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    dtRead: TADODataSet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label_DEPT_NAME: TLabel;
    Label_EMPLOYEE_NAME: TLabel;
    edt_DEPT_CODE: TEdit;
    Edt_EMPL_CODE: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btn_Find: TSpeedButton;
    Panel3: TPanel;
    qry0017: TADOQuery;
    qry0017INV_PART_NUMBER: TStringField;
    qry0017INV_PART_DESCRIPTION: TStringField;
    RzSpacer3: TRzSpacer;
    Panel4: TPanel;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    RzSpinEdit1: TRzSpinEdit;
    CheckBox1: TCheckBox;
    Panel8: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
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
    Panel9: TPanel;
    RadioGroup1: TRadioGroup;
    dtMainIF_urgency: TBooleanField;
    dtMainrkey: TAutoIncField;
    DBCheckBox1: TDBCheckBox;
    procedure dtMainAfterScroll(DataSet: TDataSet);
    procedure DghMainGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edt_DEPT_CODEChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edt_EMPL_CODEChange(Sender: TObject);
    procedure btn_FindClick(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure RzSpinEdit1Change(Sender: TObject);
    procedure tblfindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DghMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblRefreshClick(Sender: TObject);
    procedure tblFirstClick(Sender: TObject);
    procedure tblPriorClick(Sender: TObject);
    procedure tblNextClick(Sender: TObject);
    procedure tblLastClick(Sender: TObject);
    procedure tblExportClick(Sender: TObject);
    procedure dtMainFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure dtMainBeforeClose(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function  GetDataBaseDate(var dt:TADODataSet;TType:Integer=1):TDateTime;
//    procedure BitBtn1Click(Sender: TObject);
  private
    ColsName :array of string;
    ColsWidth:array of Integer;
    PanelHeight : Integer;
    //Curr_Date:TDate;
    Curr_DateTime:TDateTime;

    Filter_FieldName     :string;
    Filter_Panel         :TPanel;
    Filter_Label         :TLabel;
    Filter_edit          :TEdit;
    Filter_Start_DateTime:TDateTimePicker;
    Filter_End_DateTime  :TDateTimePicker;

    frmFindOutSQL:string;
    Find_NotDisplayFields  :array of string;
    Find_DisplayFields     :array of string;
    Find_FieldsName        :array of string;
    Find_QueryFieldsName   :array of string;
    Find_Def_FieldName    :array of String;
    Find_Def_Oper         :array of String;
    Find_Def_FieldValue   :array of String;
    Find_Def_Field2Value  :array of String;
    var_DropDown_Info :  TDropDownInfo; //用来记录改变字段、下拉列表、查找窗口相关信息
    DropDown_Info_List:  TObjectList ;  //DropDown_Info的容器变量

    procedure Filter_Create(ParentPanel:TPanel);
    procedure Filter_Set(ACol:TColumnEh);  //如果要使用这一功能，需要将这一方法放入DghMainTitleClick事件中
    procedure Filter_edit_Change(Sender: TObject);
    procedure Filter_DateTimePicker_KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure FindData();
    function App_init_2(AdoConn: TADoConnection): boolean;
    procedure SetEmployeeInfo(ADataSet:TDataSet;AStatusBar:TStatusBar);
    procedure OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Curr_Date : TDate;
  hMapFile: THandle;
  MapFilePointer: Pointer;
    UserRKEY:Integer;
    USER_FULL_NAME:string[40];
    USER_LOGIN_NAME:string[40];
    UserName:string[40];
    EmplRKEY:Integer;
    EMPL_CODE:string[40];
    EmplName:string[40];
    ProgRkey:Integer;
    fRight:string[20];
    vprev:string[2];

implementation

uses SelectItem1_unt,  Findcds_unt;

{$R *.dfm}


procedure TForm1.Filter_Create(ParentPanel:TPanel);
begin
  Filter_Panel:=TPanel.Create(Application);
  Filter_Panel.Parent:= ParentPanel;
  Filter_Panel.Caption:='';
  Filter_Panel.Align:=alLeft;
  Filter_Panel.BevelOuter:=bvNone;
  
  Filter_Label:=TLabel.Create(Application);
  Filter_Label.Parent:=  Filter_Panel;
  Filter_Label.Left:=5;
  Filter_Label.Top:=7; 
end;

procedure TForm1.Filter_DateTimePicker_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then   //  , VK_down
  begin
    with dtMain do
    begin
      Filtered:=False ;
      if (VarIsNull(Filter_Start_DateTime.DateTime )=False)and(VarIsNull(Filter_End_DateTime.DateTime )=False) then
      begin
        Filter:=Filter_FieldName+' >= '+QuotedStr(DateToStr(Filter_Start_DateTime.Date))+
        ' and '+Filter_FieldName+' <= '+QuotedStr(DateToStr(Filter_End_DateTime.  Date));
       // ShowMessage(Filter);
        Filtered:=True ;
      end;
    end;
  end;
end;

procedure TForm1.Filter_edit_Change(Sender: TObject);
begin
  with dtMain do
  if trim(Filter_edit.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TForm1.Filter_Set(ACol:TColumnEh);
begin
  with ACol do
  begin
    //if GetKeyState(vk_Shift)>=0 then
    if UpperCase(ACol.FieldName)<> UpperCase(Filter_FieldName) then
    begin
      if Field.DataType in[ftString,ftWideString] then
      begin
        Filter_FieldName:= ACol.FieldName;
        Filter_Label.Caption:=  ACol.Title.Caption;
        if Assigned (Filter_Start_DateTime) then
        begin
          Filter_Start_DateTime.Free;
          Filter_Start_DateTime:=nil;
          Filter_End_DateTime.Free;
          Filter_End_DateTime:=nil;
          dtMain.Filter:='';
          dtMain.Filtered:=False;
        end;

        if Assigned (Filter_edit)=False  then
        begin
          Filter_edit:=TEdit.Create(Application);
          Filter_edit.Parent:=Filter_Panel;
          Filter_edit.Top:=3;
          Filter_edit.OnChange:=Filter_edit_Change;
        end;
        Filter_edit.Text:='';
        Filter_edit.Left:= Filter_Label.Left+Filter_Label.Width+5;

        if ACol.Width < 121 then
          Filter_edit.Width:=121
        else
        if ACol.Width > 230 then
          Filter_edit.Width:=230
        else
          Filter_edit.Width:=ACol.Width;

        Filter_edit.Left:= Filter_Label.Left+Filter_Label.Width+5;
       // Filter_Label.Top:=9;
        Filter_Panel.Width:= Filter_Label.Width+Filter_edit.Width+300;
//      end
//      else
//      if Field.DataType in[ftDatetime] then
//      begin
//        Filter_FieldName:= ACol.FieldName;
//        Filter_Label.Caption:=  ACol.Title.Caption;
//        if Assigned (Filter_edit) then
//        begin
//          Filter_edit.Text:='';
//          Filter_edit.Free;
//          Filter_edit:=nil;
//        end;
//        if Assigned (Filter_Start_DateTime)=False  then
//        begin
//          Filter_Start_DateTime:=TDateTimePicker.Create(Application);
//          Filter_Start_DateTime.Parent:=Filter_Panel;
//          Filter_Start_DateTime.Top:=3;
//          Filter_Start_DateTime.OnKeyDown:=Filter_DateTimePicker_KeyDown;
//
//          Filter_End_DateTime:=TDateTimePicker.Create(Application);
//          Filter_End_DateTime.DateTime:=Curr_Date+1;
//          Filter_End_DateTime.Parent:=Filter_Panel;
//          Filter_End_DateTime.Top:=3;
//          Filter_End_DateTime.OnKeyDown:=Filter_DateTimePicker_KeyDown;
//        end;
//        Filter_Start_DateTime.Width:=90;//ACol.Width+20;
//        Filter_End_DateTime.Width:=90;//ACol.Width+20;
//        Filter_Start_DateTime.Left:= Filter_Label.Left+Filter_Label.Width+5;
//        Filter_End_DateTime.Left:= Filter_Start_DateTime.Left+Filter_Start_DateTime.Width+5;
//
//       // Filter_Label.Top:=9;
//        Filter_Panel.Width:= Filter_Label.Width+Filter_Start_DateTime.Width+Filter_End_DateTime.Width+20;  //  15
      end;
    end;
  end;
  //Filter_Panel.Width:= Filter_Label.Width+Filter_edit.Width+15;
end;

procedure TForm1.dtMainAfterScroll(DataSet: TDataSet);
begin
  with dtMain  do
  begin
    begin
      if  DataSet.Eof  then
      begin
        tblNext.Enabled:=False ;
        tblLast.Enabled:=False ;
      end
      else
      begin
        tblNext.Enabled:=True ;
        tblLast.Enabled:=True ;
      end;
      if  DataSet.Bof  then
      begin
        tblPrior.Enabled:=False     ;
        tblFirst.Enabled:=False     ;
      end
      else
      begin
        tblPrior.Enabled:=True     ;
        tblFirst.Enabled:=True     ;
      end;
      StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(dtMain.RecNo)+'/总记录数:'+ IntToStr(dtMain.RecordCount);
    end;
  end;
end;

procedure TForm1.DghMainGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (dtMain.FieldByName('IF_urgency').AsBoolean)and(dtMain.FieldByName('要求日期').Value < Curr_DateTime ) then
    AFont.Color := clRed
  else
  if (dtMain.FieldByName('IF_urgency').AsBoolean)and(dtMain.FieldByName('要求日期').Value - 1 < Curr_DateTime) then
    AFont.Color := clBlue;

//  with  (Sender as TDBGridEh)do
//  begin
//    if SumList.RecNo mod 2 = 1 then
//    Background := $00FFC4C4;
//
//    if ((State=[gdSelected]))then
//      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
//
////    DefaultDrawColumnCell(Rect,datacol,Column,state);
//  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if  dtMain.Active then
  if  dtMain.Eof then
    dtMain.First
  else
    dtMain.Next;
end;

Function  TForm1.GetDataBaseDate(var dt:TADODataSet;TType:Integer=1):TDateTime;
var
  str_SQL:string;
begin
  if TType=0 then
    str_SQL:='select GetDate()'
  else
  if TType=1 then
    str_SQL:='select cast(getdate()as smallDatetime)'
  else
  if TType=2 then
    str_SQL:='select convert(char(10),GetDate(),120)' ;

  with  dt do
  begin
    Close;
    CommandText:=str_SQL;
    Open;
    Result:=FieldList[0].AsDateTime;
    Close;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    with dtMain do
    begin
      Curr_DateTime := GetDataBaseDate(dtRead, 1);
      Close;
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if Show_Item1_frm(qry0034,'DEPT_CODE',edt_DEPT_CODE.Text,'DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/120',edt_DEPT_CODE) then
  begin
    edt_DEPT_CODE.Text :=  qry0034.FieldByName('DEPT_CODE').AsString;
  end;

end;

procedure TForm1.edt_DEPT_CODEChange(Sender: TObject);
begin
  with Sender as TEdit do
  begin
    if  qry0034.Active = False then
    qry0034.Open;

    if qry0034.Locate('DEPT_CODE',Trim(Text),[]) then
    begin
      Label_DEPT_NAME.Caption := qry0034.FieldByName('DEPT_NAME').AsString;
    end
    else
    begin
      Label_DEPT_NAME.Caption := '';
    end;
  end;
  RzSpinEdit1.OnChange(nil);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if Show_Item1_frm(qry0005,'EMPL_CODE',edt_EMPL_CODE.Text,'EMPL_CODE/雇员代码/80,EMPLOYEE_NAME/雇员名称/120',edt_EMPL_CODE) then
  begin
    edt_EMPL_CODE.Text :=  qry0005.FieldByName('EMPL_CODE').AsString;
  end;

end;

procedure TForm1.Edt_EMPL_CODEChange(Sender: TObject);
begin
  with Sender as TEdit do
  begin
    if  qry0005.Active = False then
    qry0005.Open;

    if qry0005.Locate('EMPL_CODE',Trim(Text),[]) then
    begin
      Label_EMPLOYEE_NAME.Caption := qry0005.FieldByName('EMPLOYEE_NAME').AsString;
    end
    else
    begin
      Label_EMPLOYEE_NAME.Caption := '';
    end;
  end;
  RzSpinEdit1.OnChange(nil);
end;

procedure TForm1.btn_FindClick(Sender: TObject);
var
  str_SQL:string;
begin
  try
    Screen.Cursor := crHourGlass;

    if Trim(edt_DEPT_CODE.Text )<>'' then
    str_SQL := ' and ( Data0034.DEPT_CODE = '+QuotedStr(Trim(edt_DEPT_CODE.Text ))+' )';
    if Trim(Edt_EMPL_CODE.Text )<>'' then
    str_SQL := str_SQL+' and ( Data0005.EMPL_CODE = '+QuotedStr(Trim(Edt_EMPL_CODE.Text ))+' )';
    with dtMain do
    begin
      Close;
      CommandText :=
      Memo1.Text+#13+Memo2.Text+str_SQL+
      #13+Memo3.Text;
     // ShowMessage(CommandText);
      Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.DghMainTitleClick(Column: TColumnEh);
begin
  Filter_Set( Column);
     //排序
//  if GetKeyState(vk_Shift)<0 then  //实现排序要同时按下Shift键
  with Column.Grid.DataSource.DataSet as TCustomADODataSet do
  begin
    if FieldByName(Column.FieldName).FieldKind in[ fkCalculated,fkLookup]  then
      exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      Sort:=Column.FieldName+' DESC';
    end;
  end;

  RzSpinEdit1.OnChange(nil);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i,ColsCount:Integer;
begin
  Curr_Date := GetDataBaseDate(dtRead, 2);
  Curr_DateTime := GetDataBaseDate(dtRead, 1);
  Filter_Create(Self.Panel3);
  Filter_Set(DghMain.FieldColumns['材料编码']);
  
  //记录表格列的宽度
  ColsCount := DghMain.FieldCount ;
  SetLength(ColsName, ColsCount);
  SetLength(ColsWidth,ColsCount);
  with DghMain do
  begin
    for i := 0 to ColsCount - 1 do
    begin
      ColsName[i]  := Columns[i].Field.FieldName;
      ColsWidth[i] := Columns[i].Width;
    end;
  end;
  PanelHeight := Panel1.Height;

  RzSpinEdit1.OnChange(nil);
 // ShowMessage(IntToStr(DropDown_Info_List.Count));
  Find_DisplayFields:=VarArrayOf(['材料编码','材料描述','单位','采购数量','已接收数量',
  '欠货数量','要求日期','请购原因','采购编号','使用者','使用者电话','请购部门','请购人员']);
  Find_FieldsName      :=VarArrayOf(['材料编码','材料描述','单位','采购数量','已接收数量',
  '欠货数量','要求日期','请购原因','采购编号','使用者','使用者电话','请购部门','请购人员']);
  Find_QueryFieldsName :=VarArrayOf(['Data0017.INV_PART_NUMBER','Data0017.INV_PART_DESCRIPTION',
  'Data0002.UNIT_NAME','Data0071.QUAN_ORD','Data0071.QUAN_RECD',
  'dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD' ,'Data0071.REQ_DATE','Data0071.reason','Data0070.PO_NUMBER','Data0068.user_name',
  'Data0068.user_phone','Data0034.DEPT_NAME','Data0005.EMPLOYEE_NAME']);
//  Find_Def_FieldName  :=VarArrayOf(['USER_DATE']);
//  Find_Def_Oper       :=VarArrayOf(['>']);
//  Find_Def_FieldValue :=VarArrayOf([DateToStr(Curr_Date-180)]);
//  Find_Def_Field2Value :=VarArrayOf(['']);

//  Find_DisplayFields:=VarArrayOf(['FASSET_CODE', 'FASSET_NAME', 'FASSET_DESC','LOCATION',
//  'WAREHOUSE_CODE','ABBR_NAME', 'DEPT_CODE','DEPT_NAME','active_flag','equipment_grade',
//  'Capacity','RateProd','Scan_QTY','REMARK', 'USER_DATE','USER_LOGIN_NAME','USER_FULL_NAME']);
//  Find_FieldsName      :=VarArrayOf(['FASSET_CODE', 'FASSET_NAME', 'FASSET_DESC','LOCATION',
//  'WAREHOUSE_CODE','ABBR_NAME', 'DEPT_CODE','DEPT_NAME','active_flag','equipment_grade',
//  'Capacity','RateProd','Scan_QTY','REMARK', 'USER_DATE','USER_LOGIN_NAME','USER_FULL_NAME']);
//  Find_QueryFieldsName :=VarArrayOf(['[Y1417].FASSET_CODE','[Y1417].FASSET_NAME','[Y1417].FASSET_DESC','[Y1417].LOCATION',
//  '[Data0015].WAREHOUSE_CODE','[Data0015].ABBR_NAME', '[Data0034].DEPT_CODE','[Data0034].DEPT_NAME','[Y1417].active_flag','[Y1417].equipment_grade',
//  '[Y1417].Capacity','[Y1417].RateProd','[Y1417].Scan_QTY','[Y1417].REMARK', '[Y1417].USER_DATE','Data0073.USER_LOGIN_NAME','Data0073.USER_FULL_NAME']);
//  Find_Def_FieldName  :=VarArrayOf(['USER_DATE']);
//  Find_Def_Oper       :=VarArrayOf(['>']);
//  Find_Def_FieldValue :=VarArrayOf([DateToStr(Curr_Date-180)]);
//  Find_Def_Field2Value :=VarArrayOf(['']);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled := CheckBox1.Checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Timer2.Enabled := CheckBox2.Checked;
end;

procedure TForm1.RzSpinEdit1Change(Sender: TObject);
var
  i:Integer;
begin
  DghMain.Font.Size := Round( RzSpinEdit1.Value);
  Panel8.Font.Size  := Round( RzSpinEdit1.Value);
  for i := 0 to High(colsName) - 1 do
  begin
    DghMain.FieldColumns[colsName[i]].Width := Round(ColsWidth[i] * Round( RzSpinEdit1.Value) / 9 )  ;
  end;
//  Panel1.Height := Round(PanelHeight *  Round( RzSpinEdit1.Value) / 9 ) ;
//  Panel_Bottom.Height := Round( 16 *  Round( RzSpinEdit1.Value) / 9 ) +10;
//  StatusBar1.Panels[0].Width :=  Round(180 *  Round( RzSpinEdit1.Value) / 9 ) ;
  //ShowMessage(RzSpinEdit1.Value);


//  edt_DEPT_CODE.Left  := Label1.Left +Label1.Width + 2;
//  edt_DEPT_CODE.Width := Round(60 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  BitBtn1      .Left  := edt_DEPT_CODE.Left + edt_DEPT_CODE.Width +2  ;
//  Label_DEPT_NAME.Left:= BitBtn1.Left+BitBtn1.Width+2  ;
//  Label2.Left         := Label_DEPT_NAME.Left + Label_DEPT_NAME.Width+15;
//  Edt_EMPL_CODE.Left  := Label2.Left  + Label2.Width+2;
//  Edt_EMPL_CODE.Width := Round(60 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  BitBtn2.Left        := Edt_EMPL_CODE.Left + Edt_EMPL_CODE.Width+2;
//  Label_EMPLOYEE_NAME.Left := BitBtn2.Left + BitBtn2.Width+2;
//  SpeedButton1.Left   := Label_EMPLOYEE_NAME.Left+ Label_EMPLOYEE_NAME.Width+2;
//  Panel1.Width        := SpeedButton1.Left+ SpeedButton1.Width+15;
//
//  Filter_edit.Left    := Filter_Label.Left + Filter_Label.Width +2;
//  Panel3.Width        := Filter_edit.Left +  Filter_edit.Width+2;
//  RzSpinEdit1.Width   := Round(20 *  Round( RzSpinEdit1.Value) / 9 )+20 ;
//
//  RzSpacer3.Width  :=  Round(17 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  CheckBox1.Height :=  Round(17 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  CheckBox2.Height :=  Round(17 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  CheckBox1.Width  :=  Round(65 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  CheckBox2.Width  :=  Round(65 *  Round( RzSpinEdit1.Value) / 9 ) ;
//  CheckBox2.Left   := CheckBox1.Left + CheckBox1.Width+5;
//  Label3.Left      := CheckBox2.Left + CheckBox1.Width+5;
//  RzSpinEdit1.Left := Label3.Left    + Label3.Width +5  ;
//  Panel4.Height    := RzToolbar1 .Height;
//  Panel4.Width     := RzSpinEdit1 .Left + RzSpinEdit1.Width +2;
  DBCheckBox1.Left := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit1.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit2.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit3.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit4.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit5.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit6.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit7.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit8.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit9.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit10.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit11.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit12.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit13.Left     := Round(Label8.Left+Label8.Width+10 * Round( RzSpinEdit1.Value) / 9 ) ;

  DBEdit1.Width    := Round(200 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit2.Width    := Round(300 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit3.Width    := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit4.Width    := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit5.Width    := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit6.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit7.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit8.Width     := Round(300 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit9.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit10.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit11.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit12.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;
  DBEdit13.Width     := Round(121 * Round( RzSpinEdit1.Value) / 9 ) ;

//  BitBtn1.Top      := Round((edt_DEPT_CODE.Top + edt_DEPT_CODE.Height -  BitBtn1.Height)/ 2);
//  BitBtn2.Top      := Round((edt_DEPT_CODE.Top + edt_DEPT_CODE.Height -  BitBtn1.Height)/ 2);
//  SpeedButton1.Top := Round((edt_DEPT_CODE.Top + edt_DEPT_CODE.Height -  BitBtn1.Height)/ 2);
//
//  if Self.Font.Size = 9 then
//  begin
//    RzToolbar1.ButtonWidth  := 39;
//    RzToolbar1.ButtonHeight := 37;
//    StatusBar1.Height := 19 ;
//    
//  end
//  else
//  if Self.Font.Size = 10 then
//  begin
//    RzToolbar1.ButtonWidth  := 40;
//    RzToolbar1.ButtonHeight := 38;
//    StatusBar1.Height := 20 ;
//  end
//  else
//  if Self.Font.Size = 11 then
//  begin
//    RzToolbar1.ButtonWidth  := 41;
//    RzToolbar1.ButtonHeight := 39;
//    StatusBar1.Height := 21 ;
//  end
//  else
//  if Self.Font.Size in[ 12,13] then
//  begin
//    RzToolbar1.ButtonWidth  := 42;
//    RzToolbar1.ButtonHeight := 40;
//    StatusBar1.Height := 23 ;
//  end
//  else
//  if Self.Font.Size in[ 14,15] then
//  begin
//    RzToolbar1.ButtonWidth  := 44;
//    RzToolbar1.ButtonHeight := 42;
//    StatusBar1.Height := 25;
//  end
//  else
//  if Self.Font.Size in[16,17] then
//  begin
//    RzToolbar1.ButtonWidth  := 46;
//    RzToolbar1.ButtonHeight := 44;
//    StatusBar1.Height := 27 ;
//  end
//  else
//  if Self.Font.Size in[18,19] then
//  begin
//    RzToolbar1.ButtonWidth  := 48;
//    RzToolbar1.ButtonHeight := 46;
//    StatusBar1.Height := 29 ;
//  end
//  else
//  if Self.Font.Size in[21,20] then
//  begin
//    RzToolbar1.ButtonWidth  := 50;
//    RzToolbar1.ButtonHeight := 48;
//    StatusBar1.Height := 31;
//  end
//  else
//  if Self.Font.Size in[22,23] then
//  begin
//    RzToolbar1.ButtonWidth  := 52;
//    RzToolbar1.ButtonHeight := 50;
//    StatusBar1.Height := 33 ;
//  end
//  else
//  if Self.Font.Size in[24,25] then
//  begin
//    RzToolbar1.ButtonWidth  := 54;
//    RzToolbar1.ButtonHeight := 52;
//    StatusBar1.Height := 33 ;
//  end  ;
//  Panel4.Update;

end;

procedure TForm1.FindData();
begin
  try
    Screen.Cursor := crHourGlass;
    if ShowfrmFindcds(dtMain,frmFindOutSQL,DropDown_Info_List,Find_NotDisplayFields,Find_DisplayFields,Find_FieldsName,
    Find_QueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    begin
      try
        dtMain.Close;
        dtMain.CommandText:= Memo1.Text + #13 + Memo2.Text + #13 + 'and '+frmFindOutSQL + Memo3.Text;

        dtMain.Open;
      finally
       // cdsMain.F_IsBatchOperating:=False;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.tblfindClick(Sender: TObject);
begin
  FindData;
end;

function TForm1.App_init_2(AdoConn: TADoConnection): boolean;
var
  ZAppName: array[0..127] of char;
  db_ptr,s,title_name,data_name: String;
  Found: HWND;
  vprog: pchar;
begin
  try
    result := true;
    hMapFile := CreateFileMapping($FFFFFFFF, nil, page_ReadWrite, 0, 100, 'coimasp20');
    MapFilePointer := MapViewOfFile(hMapFile, File_Map_All_Access, 0, 0, 0);
    S := PAnsiChar(MapFilePointer);
    UserRKEY := StrToInt(copy(S,1,pos(' ',s)-1));
    vprev := copy(S, pos(' ', s) + 1, 1);
    data_name:=copy(S, pos('/', s) + 1, pos(',', s)-pos('/', s)-1);
    db_ptr := trim(copy(S, pos(',', s) + 1, length(s) - pos(',', s)));
    if trim(db_ptr) = '' then
    begin
      result := false;
      exit;
    end;

    title_name := application.Title+' '+data_name;
    application.Title := 'OnlyOne' + IntToStr(HInstance);
    vprog := pchar(title_name);

    strpcopy(ZAppName, vprog);
    Found := FindWindow(nil, ZAppName);
    if Found <> 0 then
    begin
      ShowWindow(Found, SW_SHOWMINIMIZED);
      ShowWindow(Found, SW_SHOWNORMAL);
      application.Terminate;
    end;
    application.Title := title_name;

    AdoConn.Connected := false;
    AdoConn.ConnectionString := db_ptr;
    AdoConn.Connected := true;
  except
    result := false;
  end;
end;

procedure TForm1.SetEmployeeInfo(ADataSet:TDataSet;AStatusBar:TStatusBar);
var
  str_SQL:string;
begin
  str_SQL:= 'select d3.USER_FULL_NAME,d3.USER_LOGIN_NAME,d3.EMPLOYEE_PTR,d5.EMPLOYEE_NAME,d5.EMPL_CODE '
        +' from data0073 d3 left join data0005 d5 on d3.EMPLOYEE_PTR=d5.rkey where d3.rkey='+IntToStr(UserRKEY);
  if ADataSet is TADODataSet then
  with ADataSet as TADODataSet do
  begin
    Close;
    CommandText:=str_SQL;
    Open;
  end
  else
  if ADataSet is TADOQuery then
  with ADataSet as TADOQuery do
  begin
    Close;
    SQL.Text:=str_SQL;
    Open;
  end;
  with  ADataSet do
  if IsEmpty=False then
  begin
    UserName       := FieldByName('USER_FULL_NAME').Value ;
    USER_FULL_NAME := FieldByName('USER_FULL_NAME').Value ;
    USER_LOGIN_NAME:= FieldByName('USER_LOGIN_NAME').Value ;
    EmplRKEY       := FieldByName('EMPLOYEE_PTR').AsInteger ;
    EMPL_CODE      := FieldByName('EMPL_CODE').Value ;
    EmplName       := FieldByName('EMPLOYEE_NAME').Value ;
    AStatusBar.Panels[1].Text:='用户名：'+trim(USER_FULL_NAME)+' ('+trim(USER_LOGIN_NAME)+')';
  end;
  ADataSet.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin  
  if not App_init_2(ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;                   {  }
  Caption:=application.Title ;

 {  ADOConnection1.Close;                                                                                                             //   wisdompcb_idtrace
  ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  ADOConnection1.Open;
  UserRKEY := 1;
  vprev:='4'; }
  SetEmployeeInfo(dtRead,StatusBar1) ;

  DropDown_Info_List:=         TObjectList.Create();

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo:='DEPT_CODE/部门代码/80,DEPT_NAME/部门名称/120';
    L_FindDataSet           :=qry0034;            //仅仅只是在"查找窗口"出现下拉列表
    L_DropdownColumn        :='请购部门';//
    L_ListDataSetFilterField:='DEPT_CODE';
    L_ListResultField       :='DEPT_NAME';
    L_GetValueField         :='请购部门';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo:='EMPL_CODE/请购人代码/80,EMPLOYEE_NAME/请购人/120';
    L_FindDataSet           :=qry0005;            //仅仅只是在"查找窗口"出现下拉列表
    L_DropdownColumn        :='请购人员';//
    L_ListDataSetFilterField:='EMPL_CODE';
    L_ListResultField       :='EMPLOYEE_NAME';
    L_GetValueField         :='请购人员';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo:='INV_PART_NUMBER/材料代码/150,INV_PART_DESCRIPTION/材料名称/250';
    L_FindDataSet           :=qry0017;            //仅仅只是在"查找窗口"出现下拉列表
    L_DropdownColumn        :='材料编码';//
    L_ListDataSetFilterField:='INV_PART_NUMBER';
    L_ListResultField       :='INV_PART_NUMBER';
    L_GetValueField         :='材料编码';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;

  if not(StrToInt(vprev)  in [2,4]) then
  dtMainIF_urgency.ReadOnly := True;
  btn_Find.Click;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DropDown_Info_list);
end;

procedure TForm1.DghMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then   
  with   (Sender as TDBGridEh).DataSource do
  begin
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
  end;
end;

procedure TForm1.tblRefreshClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    dtMain.Close;
    dtMain.Open;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.tblFirstClick(Sender: TObject);
begin

    if dtMain.Active then
    begin
      dtMain.First;
    end;
end;

procedure TForm1.tblPriorClick(Sender: TObject);
begin
    if dtMain.Active then
    begin
      dtMain.Prior;
    end;
end;

procedure TForm1.tblNextClick(Sender: TObject);
begin
    if dtMain.Active then
    begin
      dtMain.Next;
    end;
end;

procedure TForm1.tblLastClick(Sender: TObject);
begin
    if dtMain.Active then
    begin
      dtMain.Last;
    end;
end;

procedure TForm1.tblExportClick(Sender: TObject);
begin
  OutputExcelStd(Self,DghMain);
end;

procedure TForm1.OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh);
var
  ExpClass:TDBGridEhExportClass  ;
  Ext:String;
  FFileName:string;
  SaveDialog1:TSaveDialog;
begin
  SaveDialog1:=TSaveDialog.Create(AForm);
  SaveDialog1.Filter:='*.xls|*.xls|*.csv|*.csv|*.htm|*.htm|*.txt|*.txt';
  SaveDialog1.FileName := AForm.Caption;
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1: begin ExpClass := TDBGridEhExportAsXLS;  Ext := 'xls'; end;
      2: begin ExpClass := TDBGridEhExportAsCSV;  Ext := 'csv'; end;
      3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      4: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
    else
      ExpClass := nil; Ext := '';
    end;

    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
          UpperCase(Ext) then
        FFileName := SaveDialog1.FileName + '.' + Ext;
      if   FileExists(FFileName)   then
      if messagedlg('文件“'+FFileName+'”已经存在,你要覆盖吗?',mtconfirmation,[mbyes,mbno],0)=mrNo then
        Exit;
      try
        Screen.Cursor := crHourGlass;
        ADBGridEh.DataSource.DataSet.DisableControls;
        SaveDBGridEhToExportFile(ExpClass,ADBGridEh,FFileName,True);    //导出全部数据。
      finally
        ADBGridEh.DataSource.DataSet.EnableControls;
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TForm1.dtMainFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Filter_edit) then
  if Trim(Filter_edit.Text) <>'' then
    Accept:=AnsiContainsText(
    UpperCase(DataSet.FieldByName(Filter_FieldName).AsString),
    UpperCase(Filter_edit.Text )
    ) ;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    Memo2.Lines.Text := 'WHERE (dbo.Data0071.IF_urgency = 1)'+#13+
    ' AND (dbo.Data0070.STATUS IN (1, 5))'+ #13+
    ' AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)'
  else
  if RadioGroup1.ItemIndex = 1 then
    Memo2.Lines.Text := 'WHERE (dbo.Data0071.IF_urgency = 0)'+ #13+
    ' AND (dbo.Data0070.STATUS IN (1, 5))'+ #13+
    ' AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)'
  else
  if RadioGroup1.ItemIndex = 2 then
    Memo2.Lines.Text :=
    'where (dbo.Data0070.STATUS IN (1, 5))'+ #13+
    ' AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)';

  btn_Find.Click;
end;

procedure TForm1.dtMainBeforeClose(DataSet: TDataSet);
begin
  with DataSet as TADODataSet do
  if (State in [dsInsert,dsEdit]) then
  if messagebox(Self.Handle,'数据还没有保存，你要保存吗？','提示',MB_yesno+MB_iconquestion)  =mrYes then
  Post;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtMain.Close;
end;

end.
