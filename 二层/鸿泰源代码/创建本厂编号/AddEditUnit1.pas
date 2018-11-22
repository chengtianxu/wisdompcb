unit AddEditUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,Buttons, ExtCtrls,  DB, Grids,DateUtils,
  ADODB,StrUtils,SysConst, DBGrids, DBCtrls,Mask,Menus,math,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;


const
  changeUnit2 = 1000000;
  rev2 = 'A0';    //'-A0';

type
  TAddEditForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    BitBtn9: TBitBtn;
    Edit5: TEdit;
    Label20: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Label13: TLabel;
    Edit12: TEdit;
    RadioGroup2: TRadioGroup;
    Edit10: TEdit;
    Label11: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    Label15: TLabel;
    Edit14: TEdit;
    Label16: TLabel;
    Label18: TLabel;
    Edit16: TEdit;
    Label17: TLabel;
    Edit15: TEdit;
    Label12: TLabel;
    Label9: TLabel;
    Edit8: TEdit;
    RadioButton1: TCheckBox;
    DataSource1: TDataSource;
    ADOQ0089: TADOQuery;
    ADOQ0089rkey: TAutoIncField;
    ADOQ0089pact_ptr: TIntegerField;
    ADOQ0089cust_part_ptr: TIntegerField;
    ADOQ0089parameter_ptr: TIntegerField;
    ADOQ0089tvalue: TStringField;
    ADOQ0089MyPARAMETER_NAME: TStringField;
    ADOQ0089MyPARAMETER_DESC: TStringField;
    ADOQ0089MyUNIT_NAME: TStringField;
    ADOQ0089MyDATATYPE: TStringField;
    Edit2: TEdit;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    Label10: TLabel;
    Memo2: TMemo;
    Label14: TLabel;
    Memo3: TMemo;
    GroupBox1: TGroupBox;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    RadioGroup3: TRadioGroup;
    Label8: TLabel;
    Memo1: TMemo;
    Label26: TLabel;
    Edit4: TEdit;
    Label27: TLabel;
    Edit9: TEdit;
    Label28: TLabel;
    Edit11: TEdit;
    Label29: TLabel;
    Edit13: TEdit;
    Label30: TLabel;
    Memo4: TMemo;
    Label31: TLabel;
    Memo5: TMemo;
    Label32: TLabel;
    Edit17: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Edit18: TEdit;
    BitBtn4: TBitBtn;
    current_ck: TCheckBox;
    DBGrid1: TDBGrid;
    Label35: TLabel;
    Edit19: TEdit;
    BtnCopy: TButton;
    Edit20: TEdit;
    Label36: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel2: TPanel;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    Edit21: TEdit;
    btnRFQ: TBitBtn;
    Label37: TLabel;
    Edit22: TEdit;
    Label38: TLabel;
    Edit23: TEdit;
    Label39: TLabel;
    BitBtn5: TBitBtn;
    rg1: TRadioGroup;
    lbl1: TLabel;
    dbtxtCustFileName: TDBText;
    btn1: TButton;
    btn2: TButton;
    pnl1: TPanel;
    btn3: TButton;
    lbl2: TLabel;
    lbl3: TLabel;
    edtftpip: TEdit;
    lbl4: TLabel;
    edtftpusername: TEdit;
    edtftppassword: TEdit;
    IdFTP1: TIdFTP;
    dlgOpen1: TOpenDialog;
    edtftpdir: TEdit;
    lbl5: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ADOQ0089AfterScroll(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRFQClick(Sender: TObject);
    procedure Edit22Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit23Change(Sender: TObject);
    procedure Edit23Exit(Sender: TObject);
    procedure dbrgrppricing_principleChange(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    vrkey0010,vrkey0008,vrkey0504,vrkey0015:integer;
    VMyEditMode :INTEGER; //0:新增 1:编辑 2:检查 3:只编辑客户型号
        rkey08,sales_flag,rkey10,rkey25,rkey15 ,vuser_ptr:integer;
    vs2:boolean;
    vEdit18Text:string;
    v81PRECHAR1,v81PRECHAR2,v81sufchar:string;
    CODE3:string;
    OldGridWnd : TWndMethod;
    procedure NewGridWnd (var Message : TMessage);
    function Get_MyEditMode: integer;
    procedure sET_MyEditMode(const Value: integer);
    function Get_Myuser_ptrCaption: integer;
    procedure Set_Myuser_ptrCaption(const Value: integer);
    function Get_Myrkey0008: integer;
    function Get_Myrkey0010: integer;
    procedure sET_Myrkey0008(const Value: integer);
    procedure sET_Myrkey0010(const Value: integer);

    function Add_ADOQ0089(const groupptr2 : string):boolean;
    FUNCTION NewProject2(PROD_CODE_PTR2,whouse_ptr : integer):string;
    function ProjectToNumber(const Project2:string;var p2:string;var value2,Number2 :integer):boolean;
    FUNCTION CheckProjectT2(const Project2:string):boolean;
    function CheckCustCode2(const CustCode2:string):boolean;
    function ChangeProdCodeValue(const vvalue:integer):boolean;
 //   procedure Abort3;
    function AddOne_1():boolean;
    function AddOne_2():boolean;
    function getparent_ptr(node: TTreeNode): integer;
    procedure CopyStandar(Sender: TObject);
    procedure get_treedate(rkey25: integer;treeview:Ttreeview);
    procedure append_log119(rkey: integer);
    procedure UPDATEDATA0025(RKEY:integer);
    procedure update_08();
    function Abbr_NameCheck: Boolean;
  public
    { Public declarations }
    property MyEditMode:integer read Get_MyEditMode WRITE sET_MyEditMode ;
    property Myuser_ptrCaption:integer read Get_Myuser_ptrCaption write Set_Myuser_ptrCaption;

    property Myrkey0010:integer read Get_Myrkey0010 WRITE sET_Myrkey0010 ;
    property Myrkey0008:integer read Get_Myrkey0008 WRITE sET_Myrkey0008 ;
  end;

type
 TMyDBGrid=class(TDBGrid);
   
var
  AddEditForm1: TAddEditForm1;

implementation

uses
   DMUnit1 ,common   ,Pick_Item_Single   ,ConstVar, FindRFQ, IniFiles;

{$R *.dfm}

function TAddEditForm1.getparent_ptr(node: TTreeNode): integer;
var parent_code:TTreeNode;
begin
 parent_code:=node.Parent;
 result:=Pinteger(parent_code.data)^;
end;


procedure TAddEditForm1.NewGridWnd(var Message: TMessage);
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

procedure TAddEditForm1.BitBtn2Click(Sender: TObject);
begin
  if ADOQ0089.Active then
      begin
       ADOQ0089.CancelUpdates ;
       ADOQ0089.close;
      end ;
  if dm.ADOQuery2.Active then
      begin
       dm.ADOQuery2.CancelUpdates ;
       dm.ADOQuery2.Close ;
      end;
  if dm.ADOQ0008.Active then
      begin
         // dm.ADOQ0008.CancelUpdates ;
       dm.ADOQ0008.Close ;
      end;
  self.ModalResult:=mrcancel;

end;

function TAddEditForm1.CheckProjectT2(const Project2: string): boolean;

begin
  result := false ;
  dm.TemADOQuery1.Close;
  dm.TemADOQuery1.SQL.Clear ;
  dm.TemADOQuery1.SQL.Add('select rkey from data0025 where MANU_PART_NUMBER ='''+Project2+'''');
  if dm.ADOQuery2.Active then
   if not dm.ADOQuery2rkey.IsNull then
    dm.TemADOQuery1.SQL.Add(' and rkey<>'+dm.ADOQuery2rkey.AsString);

  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;
  if dm.TemADOQuery1.IsEmpty then
   result := true
  else
   result := false ;
  dm.TemADOQuery1.Close ;
end;

procedure TAddEditForm1.BitBtn1Click(Sender: TObject);
var
  createtime2 :tdatetime;
  rkey,i,j,i73,vrkey0008_standar:integer;
  QueryTmp1:TADOQuery;
  tmpS: string;
begin
  if not Abbr_NameCheck then
  begin
    Edit23.SetFocus;
    Exit;
  end;
  QueryTmp1:=TADOQuery.Create(Self);
  QueryTmp1.Connection := DM.ADOConnection1;

  //既然 VMyEditMode 在1,3的情况都有可能用到，干脆提到if判断前面
  createtime2 :=getsystem_date(dm.TemADOQuery1,0);

  dm.TemADOQuery1.SQL.Clear ;
  dm.TemADOQuery1.SQL.Add('select top 1 rkey from data0073 where EMPLOYEE_PTR = ' + inttostr(self.Myuser_ptrCaption));
  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;
  i73 := dm.TemADOQuery1.FieldValues['rkey'] ;
  dm.TemADOQuery1.Close ;

  if VMyEditMode = 3 then   //只编辑客户型号
    begin
      dm.ADOConnection1.BeginTrans ;
      try

        if trim(dm.ADOQuery2MANU_PART_DESC.AsString) <> trim(edit3.Text) then
         begin
          dm.ADOQ0318.Append ;
          dm.ADOQ0318CUSTOMER_PART_PTR.AsInteger := dm.ADOQuery1rkey.Value;
          dm.ADOQ0318TRANS_TYPE.AsInteger := 25;
          dm.ADOQ0318TRANS_DESCRIPTION.AsString := '更改客户型号';
          dm.ADOQ0318FROM_STRING.AsString := dm.ADOQuery2MANU_PART_DESC.AsString ;
          dm.ADOQ0318TO_STRING.AsString := edit3.Text;
          dm.ADOQ0318USER_PTR.AsInteger := i73;//self.Myuser_ptrCaption ;
          dm.ADOQ0318TRANS_DATE.AsDateTime := createtime2 ;
          dm.ADOQ0318PROGRAM_SOURCE.AsInteger := 25;
          dm.ADOQ0318.UpdateBatch();
         end;

        if trim(dm.ADOQuery2ANALYSIS_CODE_2.AsString) <> trim(edit8.Text) then  //增加对客户物料号的日志记录
         begin
          dm.ADOQ0318.Append ;
          dm.ADOQ0318CUSTOMER_PART_PTR.AsInteger := dm.ADOQuery1rkey.Value;
          dm.ADOQ0318TRANS_TYPE.AsInteger := 25;
          dm.ADOQ0318TRANS_DESCRIPTION.AsString := '更改客户物料号';
          dm.ADOQ0318FROM_STRING.AsString := dm.ADOQuery2ANALYSIS_CODE_2.AsString ;
          dm.ADOQ0318TO_STRING.AsString := edit8.Text;
          dm.ADOQ0318USER_PTR.AsInteger := i73;//self.Myuser_ptrCaption ;
          dm.ADOQ0318TRANS_DATE.AsDateTime := createtime2 ;
          dm.ADOQ0318PROGRAM_SOURCE.AsInteger := 25;
          dm.ADOQ0318.UpdateBatch();
         end;

        dm.ADOQuery2.Edit ;
                   if rg1.ItemIndex = 0 then
                    dm.ADOQuery2pricing_principle.Value := 0
                   else
                   if rg1.ItemIndex = 1 then
                    dm.ADOQuery2pricing_principle.Value := 1;        
        dm.ADOQuery2MANU_PART_DESC.Value := edit3.Text;      //客户型号
        dm.ADOQuery2ANALYSIS_CODE_3.AsString := edit17.Text ;//大料规格
        dm.ADOQuery2ANALYSIS_CODE_2.AsString := edit8.Text;  //客户物料号
        dm.ADOQuery2memo_text.AsString := Memo1.Text ;       //市场备注
        dm.ADOQuery2SAMPLE_NR.Value:=edit6.Text;             //测式成型备注
        if Trim(Edit23.Text) <> '' then
          dm.ADOQuery2ORIG_CUSTOMER.Value:=Edit23.Text        //关联原客户
        else
          dm.ADOQuery2.FieldByName('ORIG_CUSTOMER').Value := null;
        if Edit22.Text <> '' then
          dm.ADOQuery2RFQNo.Value:=Edit22.Text;              //RFQ编号
        dm.ADOQuery2.UpdateBatch();

        with dm.TemADOQuery1 do        //更新第二层
         begin
          close;
          sql.Text:='update data0025'+#13+
                   'set MANU_PART_DESC=Data0025_1.MANU_PART_DESC,'+#13+
                   'memo_text=Data0025_1.memo_text,'+#13+
                   'ANALYSIS_CODE_2=Data0025_1.ANALYSIS_CODE_2,'+#13+
                   'ORIG_CUSTOMER=Data0025_1.ORIG_CUSTOMER'+#13+
                   'FROM Data0025 INNER JOIN'+#13+
          'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
          'where Data0025_1.RKEY='+dm.ADOQuery2RKEY.AsString;
          ExecSQL;
         end;

        with dm.TemADOQuery1 do      //更新第三层         {修改外层客户型号自动修改内层型号}
         begin
          close;
          sql.Text:='update data0025'+#13+
                   'set DATA0025.MANU_PART_DESC=Data0025_2.MANU_PART_DESC,'+#13+
                   'memo_text=Data0025_2.memo_text,'+#13+
                   'ANALYSIS_CODE_2=Data0025_2.ANALYSIS_CODE_2,'+#13+
                   'ORIG_CUSTOMER=Data0025_2.ORIG_CUSTOMER'+#13+
            'FROM data0025 INNER JOIN  '+#13+
            'Data0025 Data0025_1 ON'+#13+
            'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
            'Data0025 Data0025_2 ON '+#13+
            'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
           'where Data0025_2.RKEY = '+dm.ADOQuery2RKEY.AsString;
          ExecSQL;
         end;

         with dm.TemADOQuery1 do      //更新第四层         {修改外层客户型号自动修改内层型号}
         begin
          close;
          sql.Text:='update data0025'+#13+
                   'set DATA0025.MANU_PART_DESC=Data0025_3.MANU_PART_DESC,'+#13+
                   'memo_text=Data0025_3.memo_text,'+#13+
                   'ANALYSIS_CODE_2=Data0025_3.ANALYSIS_CODE_2,'+#13+
                   'ORIG_CUSTOMER=Data0025_3.ORIG_CUSTOMER'+#13+
            'FROM data0025 INNER JOIN  '+#13+
            'Data0025 Data0025_1 ON'+#13+
            'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
            'Data0025 Data0025_2 ON '+#13+
            'Data0025_1.PARENT_PTR = Data0025_2.RKEY inner join '+#13+
            'Data0025 Data0025_3 ON '+#13+
            'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
           'where Data0025_3.RKEY = '+dm.ADOQuery2RKEY.AsString;
          ExecSQL;
         end;
        dm.ADOConnection1.CommitTrans ;
        self.ModalResult := mrok;
      except
          dm.ADOConnection1.RollbackTrans ;
          showmessage('保存不成功,请退出后重新操作');
      end;

    end
  else           //新增或者编辑写在一起 0或者 1
  begin
   if CheckBox1.Checked = false then
     begin
      dm.ADOQ0008.Close ;
      dm.ADOQ0008.Parameters.ParamValues['reky0008'] := vrkey0008 ;
      dm.ADOQ0008.Prepared ;
      dm.ADOQ0008.Open ;
      if not dm.ADOQ0008.IsEmpty then
       begin
        dm.ADOQ0081.Close ;
        dm.ADOQ0081.Parameters.ParamValues['layer_pre'] := dm.ADOQ0008layer_pre.AsInteger  ;
        dm.ADOQ0081.Prepared ;
        dm.ADOQ0081.Open ;
       end;
     end;

    if edit1.Text = '' then
      begin
        showmessage('请选择输入客户代码');
        PageControl1.ActivePageIndex := 0;
        edit1.SetFocus ;
        exit;
      end
    else
      begin
        if CheckCustCode2(edit1.Text) then
          begin
            PageControl1.ActivePageIndex := 0 ;
            edit1.SetFocus ;
            showmessage('输入的客户代码有错，请更改!!');
            exit;
          end ;
      end;
   if edit5.Text = '' then
    begin
      showmessage('请选择输入产品类别代码');
      PageControl1.ActivePageIndex := 0 ;
      edit5.SetFocus ;
      exit;
    end;

   if edit2.Text = '' then
    begin
      showmessage('请输入本厂编号');
      PageControl1.ActivePageIndex := 0 ;
      exit;
    end
   ELSE
    BEGIN
      if not (CheckProjectT2(trim(edit2.Text))) then
        if CheckBox1.Checked then  //自动编号重复，要生成一个新的编号
         begin
          if Messagedlg('输入的本厂编号重复，要重算编号吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              PageControl1.ActivePageIndex := 0 ;
              //yyy 2009.8.25
              edit2.Text := NewProject2(vrkey0008,self.vrkey0015);///
            ///  AddOne_2();
              //yyy 2009.8.25
              if not(Messagedlg('输入的本厂编号已更改为' + edit2.Text + '，要保存吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
               exit ;
            end
          else {}
           exit ;

         end
        else
         begin
          showmessage('输入的本厂编号重复,请更改！！多谢!!!') ;
          PageControl1.ActivePageIndex := 0 ;
          edit2.SetFocus ;
          exit ;
         end
    END;
   if (edit12.Text = '')   then
    begin
      showmessage('请输入层数');
      PageControl1.ActivePageIndex := 0 ;
      edit12.SetFocus ;
      exit ;
    end;
   if (edit10.Text = '') or (edit10.Text = '0') then
    begin
      showmessage('请输入交货单元数') ;
      PageControl1.ActivePageIndex := 0 ;
      edit10.SetFocus ;
      exit;
    end;

//   if RadioGroup2.ItemIndex = 1 then
//      begin
//        if ((trim(edit15.Text) = '') or (trim(edit15.Text) = '0')) or ((trim(edit16.Text) = '') or (trim(edit16.Text) = '0')) then
//          begin
//            showmessage('请输入PCS尺寸');
//            PageControl1.ActivePageIndex := 0 ;
//            edit15.SetFocus ;
//            exit;
//          end;
//        IF (STRTOFLOAT(trim(edit15.Text)) <= 0.0)  OR (STRTOFLOAT(trim(edit16.Text)) <= 0.0) THEN
//          BEGIN
//            showmessage('请输入PCS尺寸');
//            PageControl1.ActivePageIndex := 0 ;
//            edit15.SetFocus ;
//            exit;
//          END;
//
//          if ((edit7.Text = '') or (edit7.Text = '0')) or ((edit14.Text = '') or (edit14.Text = '0')) or ((edit15.Text = '') or (edit15.Text = '0')) or ((edit16.Text = '') or (edit16.Text = '0')) then
//            begin
//              showmessage('请输入交货尺寸');
//              PageControl1.ActivePageIndex := 0 ;
//              edit7.SetFocus ;
//              exit;
//            end;
//          IF (STRTOFLOAT(edit7.Text) <= 0.0)  OR (STRTOFLOAT(edit14.Text) <= 0.0) THEN
//            BEGIN
//              showmessage('请输入交货尺寸');
//              PageControl1.ActivePageIndex := 0 ;
//              edit7.SetFocus ;
//              exit;
//            END;
//
//      end
//  else
//   if RadioGroup2.ItemIndex = 2 then
//      begin
//        if ((trim(edit15.Text) = '') or (trim(edit15.Text) = '0')) or ((trim(edit16.Text) = '') or (trim(edit16.Text) = '0')) then
//          begin
//            showmessage('请输入PCS尺寸');
//            PageControl1.ActivePageIndex := 0 ;
//            edit15.SetFocus ;
//            exit;
//          end;
//        IF (STRTOFLOAT(edit15.Text) <= 0.0)  OR (STRTOFLOAT(edit16.Text) <= 0.0) THEN
//          BEGIN
//            showmessage('请输入PCS尺寸');
//            PageControl1.ActivePageIndex := 0 ;
//            edit15.SetFocus ;
//            exit;
//          END;
//      end
//   else
//    if RadioGroup2.ItemIndex = 0 then
//     begin
//      if ((trim(edit15.Text) = '') or (trim(edit15.Text) = '0')) or ((trim(edit16.Text) = '') or (trim(edit16.Text) = '0')) then
//        begin
//          showmessage('请输入PCS尺寸');
//          PageControl1.ActivePageIndex := 0 ;
//          edit15.SetFocus ;
//          exit;
//        end;
//      IF (STRTOFLOAT(trim(edit15.Text)) <= 0.0)  OR (STRTOFLOAT(trim(edit16.Text)) <= 0.0) THEN
//        BEGIN
//          showmessage('请输入PCS尺寸');
//          PageControl1.ActivePageIndex := 0 ;
//          edit15.SetFocus ;
//          exit;
//        END;
//     end;

   IF VMyEditMode = 0 THEN    //新增
     begin
         if RadioGroup1.ItemIndex = 0 then
         begin
            vrkey0008_standar := vrkey0008 * 1000 + vrkey0008;
         end else   if RadioGroup1.ItemIndex = 1 then
         begin
            vrkey0008_standar := vrkey0008 * 100 + vrkey0008;
         end;
        QueryTmp1.close;
        QueryTmp1.sql.Text:='select * from data0025 where standar_FPC='+
                  IntToStr(vrkey0008_standar);
        QueryTmp1.open;
        if not QueryTmp1.IsEmpty then
          begin
              createtime2 := getsystem_date(dm.TemADOQuery1,0) ;
              Self.get_treedate(QueryTmp1.fieldbyname('rkey').AsInteger,treeview1);
              rkey08 := QueryTmp1.fieldbyname('PROD_CODE_PTR').AsInteger;
              rkey10:=QueryTmp1.fieldbyname('CUSTOMER_PTR').AsInteger;
              rkey25:=QueryTmp1.fieldbyname('rkey').AsInteger;
              rkey15:=QueryTmp1.fieldbyname('PROD_ROUTE_PTR').AsInteger;
              sales_flag:=QueryTmp1.fieldbyname('ONHOLD_SALES_FLAG').AsInteger;
              treeview2.Items.Assign(treeview1.Items);
              treeview2.FullExpand;
              if treeview2.Items.Count>0 then
                 treeview2.Items[0].Text:=edit2.Text;
                for i:=0 to treeview2.Items.Count-1 do
                 if i=0 then
                  treeview2.Items[i].Text:=edit2.Text
                 else
                  treeview2.Items[i].Text:= edit2.Text+'.'+
                    copy(treeview2.Items[i].Text,
                     pos('.',treeview2.Items[i].Text)+1,
                     length(treeview2.Items[i].Text)-
                     pos('.',treeview2.Items[i].Text));

                CopyStandar(Sender);
          end
        else
         begin
               dm.TemADOQuery1.Close ;
               dm.TemADOQuery1.SQL.Clear ;
               dm.TemADOQuery1.SQL.Add('select rkey from  data0025 where MANU_PART_NUMBER = '''+trim(edit2.Text) +'''');
               dm.TemADOQuery1.Open ;
               if not (dm.TemADOQuery1.IsEmpty) then
                 begin
                   dm.TemADOQuery1.Close ;
                   showmessage('本厂编号重复,请重新输入!!');
                   exit;
                 end;
               dm.TemADOQuery1.Close ;
               createtime2 := getsystem_date(dm.TemADOQuery1,0) ;

               if CheckBox1.Checked then
               begin
                tmps :=StringofChar('0',length(v81sufchar)-length(inttostr(strtoint(v81sufchar)+1)))+
     inttostr(strtoint(v81sufchar));
                DM.ADOQ0081.Requery();
                Edit2.Text := StringReplace(Edit2.Text,tmpS,dm.ADOQ0081sufchar.Value,[rfReplaceAll]);
                v81sufchar :=  trim(dm.ADOQ0081sufchar.AsString);
                end;



               DM.ADOConnection1.BeginTrans ;
               TRY
                   if CheckBox1.Checked then AddOne_1(); //更新81表流水号
                   DM.ADOQuery2.Append ;
                   DM.ADOQuery2QTY_BOM.Value := 1;

                   dm.adoquery2ttype.value := RadioGroup1.ItemIndex ;
                   dm.ADOQuery2CUSTOMER_PTR.Value := vrkey0010;
                   dm.ADOQuery2PROD_CODE_PTR.Value := vrkey0008;
                   dm.ADOQuery2prod_route_ptr.Value:= self.vrkey0015;
                   if vrkey0504 <> -9999 then
                    dm.ADOQuery2ENG_ROUTE_PTR.value := vrkey0504
                   else
                    dm.ADOQuery2ENG_ROUTE_PTR.AsVariant := null ;

                   dm.ADOQuery2CUSTPART_ENT_DATE.Value :=createtime2;

                   dm.ADOQuery2CREATED_BY_EMPL_PTR.Value := self.Myuser_ptrCaption ;

                   dm.ADOQuery2MANU_PART_NUMBER.Value :=  trim(edit2.Text);
                   dm.ADOQuery2MANU_PART_DESC.Value := edit3.Text;
                   dm.ADOQuery2SAMPLE_NR.Value := edit6.Text;
                   if rg1.ItemIndex = 0 then
                    dm.ADOQuery2pricing_principle.Value := 0
                   else
                   if rg1.ItemIndex = 1 then
                    dm.ADOQuery2pricing_principle.Value := 1;

                   DM.ADOQUERY2SO_UNIT.AsString := RadioGroup2.Items[RadioGroup2.ItemIndex];

                   dm.ADOQuery2LAYERS.AsString := edit12.Text;
                   dm.ADOQuery2set_qty.AsString := edit10.Text;
                   dm.ADOQuery2set_lngth.AsString := edit7.Text;
                   dm.ADOQuery2set_width.AsString := edit14.Text;

                   dm.ADOQuery2spell_qty.Value:=dm.ADOQuery2set_qty.Value;
                   dm.ADOQuery2spell_lngth.Value:=dm.ADOQuery2set_lngth.Value;
                   dm.ADOQuery2spell_width.Value:=dm.ADOQuery2set_width.Value;

                   dm.ADOQuery2pcs_lngth.AsString := edit15.Text;
                   dm.ADOQuery2pcs_width.AsString := edit16.Text;

                   if Trim(Edit22.Text) <> '' then
                     dm.ADOQuery2RFQNo.AsString := Edit22.Text;
                   if Trim(Edit23.Text) <> '' then
                    dm.ADOQuery2ORIG_CUSTOMER.AsString := Edit23.Text
                   else
                    dm.ADOQuery2.FieldByName('ORIG_CUSTOMER').Value := null;

                   dm.ADOQuery2pcs_sq.Value := strtofloat(TRIM(EDIT15.TEXT))*strtofloat(TRIM(EDIT16.TEXT))/changeUnit2;
                   dm.ADOQuery2unit_sq.Value  := strtofloat(TRIM(EDIT7.TEXT))*strtofloat(TRIM(EDIT14.TEXT))/strtoint(edit10.Text)/changeUnit2;

                   dm.ADOQuery2ANALYSIS_CODE_5.Value := TRIM(EDIT15.TEXT)+'mm * '+TRIM(EDIT16.TEXT)+'mm';
                   if ((TRIM(EDIT7.TEXT)<>'') or (TRIM(EDIT7.TEXT)<>'0')) and ((TRIM(EDIT14.TEXT)<>'') or (TRIM(EDIT14.TEXT)<>'0')) then
                       dm.ADOQuery2ANALYSIS_CODE_1.Value := TRIM(EDIT7.TEXT)+'mm * '+TRIM(EDIT14.TEXT)+'mm';

                   dm.ADOQuery2ANALYSIS_CODE_2.AsString := edit8.Text;

                   IF RadioButton1.Checked then
                    dm.ADOQuery2green_flag.AsString := 'Y'
                   ELSE
                    dm.ADOQuery2green_flag.AsString := 'N' ;

                   IF  current_ck.Checked then
                    dm.ADOQuery2current_rev.Value := 'Y'
                   ELSE
                    dm.ADOQuery2current_rev.Value := 'N' ;

                   IF  CheckBox2.Checked then         //无铅要求
                    dm.ADOQuery2nopb_flag.Value := 1
                   ELSE
                    dm.ADOQuery2nopb_flag.Value := 0;

                   if CheckBox3.Checked then          //REACH要求
                    dm.ADOQuery2REACH.Value:=true
                   else
                    dm.ADOQuery2REACH.Value:=false;

                   DM.ADOQuery2memo_text.AsString := Memo1.Text ;

                   DM.ADOQuery2remark.AsString := Memo4.Text;
                   DM.ADOQuery2eng_note.AsString := Memo5.Text;

                   dm.ADOQuery2TSTATUS.Value := 6 ;

                   dm.ADOQuery2OPT_LOT_SIZE.asstring := edit4.Text ;
                   dm.ADOQuery2EST_SCRAP.AsString := edit9.Text  ;
                   dm.ADOQuery2SHELF_LIFE.AsString := edit11.Text   ;
                   dm.ADOQuery2MFG_LEAD_TIME.AsString := edit13.Text   ;
                   dm.ADOQuery2REVIEW_DAYS.Value :=StrToInt(Edit19.Text);
                   dm.ADOQuery2ANALYSIS_CODE_3.AsString := edit17.Text ;//大料规格

                   DM.ADOQuery2.UpdateBatch();
                   ADOQ0089.First;
                   ADOQ0089.DisableControls ;

                   DataSource1.DataSet := nil;
                   while not ADOQ0089.Eof do
                    begin
                     if ADOQ0089cust_part_ptr.IsNull then
                       begin
                         ADOQ0089.Edit ;
                         ADOQ0089cust_part_ptr.Value := dm.ADOQuery2rkey.Value;
                       end
                     else
                       if  ADOQ0089cust_part_ptr.Value <> dm.ADOQuery2rkey.Value then
                         begin
                           ADOQ0089.Edit ;
                           ADOQ0089cust_part_ptr.Value := dm.ADOQuery2rkey.Value;
                         end;
                     ADOQ0089.Next ;
                    end;
                   ADOQ0089.UpdateBatch();
                   if RadioGroup1.ItemIndex = 0 then
                     begin
                       if dm.ADOQ_119.Active then dm.ADOQ_119.Close ;
                       dm.ADOQ_119.Prepared ;
                       dm.ADOQ_119.Open ;
                       dm.ADOQ_119.Append ;
                       dm.ADOQ_119CUST_PART_PTR.Value := dm.ADOQuery2rkey.Value;
                       dm.ADOQ_119ENT_DATE.Value :=createtime2;
                       dm.ADOQ_119.UpdateBatch();
                     end;

                   DataSource1.DataSet := ADOQ0089 ;

                   ADOQ0089.EnableControls ;

                   if VMyEditMode = 0 then
                     begin
                       if CheckBox1.Checked  then
                         begin
                           if dm.ADOQ0081.Active then
                             begin
                               dm.ADOQ0081.Post;
                               dm.ADOQ0081.Close ;
                             end;
                         end;
                     end;
                   DM.ADOConnection1.CommitTrans ;
               EXCEPT
                 on e :exception do
                  begin
                    DM.ADOConnection1.RollbackTrans ;
                    showmessage(e.Message);
                    exit;
                  end;
               END;
         end;
     END
   else
   IF (VMyEditMode = 1)  then //or (VMyEditMode = 3) THEN 只有编辑不存在3单独编辑客户型号的情况
      BEGIN

         DM.ADOConnection1.BeginTrans ;
         TRY
             ///////////////7月24号新增，用于物料号更改后，在产品MI查询——变更记录里有相应显示
///////////////-----------------------------------------------------------------
         //    createtime2 :=getsystem_date(dm.TemADOQuery1,0);
             //当客户物料号有更新时
             if trim(dm.ADOQuery2ANALYSIS_CODE_2.AsString) <> trim(edit8.Text)
             then
             begin
               dm.ADOQ0318.Append ;
               dm.ADOQ0318CUSTOMER_PART_PTR.AsInteger := dm.ADOQuery1rkey.Value;
               dm.ADOQ0318TRANS_TYPE.AsInteger := 25;
               dm.ADOQ0318TRANS_DESCRIPTION.AsString := '更改客户物料号';
               dm.ADOQ0318FROM_STRING.AsString := dm.ADOQuery2ANALYSIS_CODE_2.AsString ;
               dm.ADOQ0318TO_STRING.AsString := edit8.Text;

               dm.ADOQ0318USER_PTR.AsInteger := i73;//self.Myuser_ptrCaption ;

               dm.ADOQ0318TRANS_DATE.AsDateTime := createtime2 ;
               dm.ADOQ0318PROGRAM_SOURCE.AsInteger := 25;
               dm.ADOQ0318.UpdateBatch();
             end;
             //当客户型号有更新时
             if trim(dm.ADOQuery2MANU_PART_DESC.AsString) <> trim(edit3.Text) then
             begin

              dm.ADOQ0318.Append;
              dm.ADOQ0318CUSTOMER_PART_PTR.AsInteger := dm.ADOQuery1rkey.Value;
              dm.ADOQ0318TRANS_TYPE.AsInteger := 25;
              dm.ADOQ0318TRANS_DESCRIPTION.AsString := '更改客户型号';
              dm.ADOQ0318FROM_STRING.AsString := dm.ADOQuery2MANU_PART_DESC.AsString ;
              dm.ADOQ0318TO_STRING.AsString := edit3.Text;

              dm.ADOQ0318USER_PTR.AsInteger := i73;//self.Myuser_ptrCaption ;

              dm.ADOQ0318TRANS_DATE.AsDateTime := createtime2 ;
              dm.ADOQ0318PROGRAM_SOURCE.AsInteger := 25;
              dm.ADOQ0318.UpdateBatch();

             end;
///////////////-----------------------------------------------------------------

             DM.ADOQuery2.Edit ;
             dm.adoquery2ttype.value := RadioGroup1.ItemIndex ;
             dm.ADOQuery2CUSTOMER_PTR.Value := vrkey0010 ;
             dm.ADOQuery2PROD_CODE_PTR.Value := vrkey0008 ;
             if vrkey0504 <> -9999 then
              dm.ADOQuery2ENG_ROUTE_PTR.value := vrkey0504
             else
              dm.ADOQuery2ENG_ROUTE_PTR.AsVariant := null ;

             dm.ADOQuery2CREATED_BY_EMPL_PTR.Value := self.Myuser_ptrCaption ;

             dm.ADOQuery2MANU_PART_NUMBER.Value :=  edit2.Text ;
             dm.ADOQuery2MANU_PART_DESC.Value := edit3.Text ;
             dm.ADOQuery2SAMPLE_NR.Value := edit6.Text ;

             DM.ADOQUERY2SO_UNIT.AsString := RadioGroup2.Items[RadioGroup2.ItemIndex];

             dm.ADOQuery2LAYERS.AsString := edit12.Text ;

                              if rg1.ItemIndex = 0 then
                    dm.ADOQuery2pricing_principle.Value := 0
                   else
                   if rg1.ItemIndex = 1 then
                    dm.ADOQuery2pricing_principle.Value := 1;

             dm.ADOQuery2set_qty.AsString := edit10.Text ;
             dm.ADOQuery2set_lngth.AsString := edit7.Text ;
             dm.ADOQuery2set_width.AsString := edit14.Text ;
             dm.ADOQuery2spell_qty.Value:=dm.ADOQuery2set_qty.Value;
             dm.ADOQuery2spell_lngth.Value:=dm.ADOQuery2set_lngth.Value;
             dm.ADOQuery2spell_width.Value:=dm.ADOQuery2set_width.Value;

             dm.ADOQuery2pcs_lngth.AsString := edit15.Text ;
             dm.ADOQuery2pcs_width.AsString := edit16.Text ;
             if Trim(Edit22.Text) <> '' then
               dm.ADOQuery2RFQNo.AsString := Edit22.Text;
             if Trim(Edit23.Text) <> '' then
               dm.ADOQuery2ORIG_CUSTOMER.AsString:= Edit23.Text
             else
              dm.ADOQuery2.FieldByName('ORIG_CUSTOMER').Value := null;
             dm.ADOQuery2pcs_sq.Value := strtofloat(TRIM(EDIT15.TEXT))*strtofloat(TRIM(EDIT16.TEXT))/changeUnit2;
             dm.ADOQuery2unit_sq.Value  := strtofloat(TRIM(EDIT7.TEXT))*strtofloat(TRIM(EDIT14.TEXT))/strtoint(edit10.Text)/changeUnit2;

             dm.ADOQuery2ANALYSIS_CODE_5.Value := TRIM(EDIT15.TEXT)+'mm * '+TRIM(EDIT16.TEXT)+'mm';
             if ((TRIM(EDIT7.TEXT)<>'') or (TRIM(EDIT7.TEXT)<>'0')) and ((TRIM(EDIT14.TEXT)<>'') or (TRIM(EDIT14.TEXT)<>'0')) then
               dm.ADOQuery2ANALYSIS_CODE_1.Value := TRIM(EDIT7.TEXT)+'mm * '+TRIM(EDIT14.TEXT)+'mm';
               dm.ADOQuery2ANALYSIS_CODE_2.AsString := edit8.Text ;
             //edit14.Text := dm.ADOQuery2set_width.AsString ;


             IF RadioButton1.Checked then
              dm.ADOQuery2green_flag.AsString := 'Y'
             ELSE
              dm.ADOQuery2green_flag.AsString := 'N' ;
             IF  current_ck.Checked then
              dm.ADOQuery2current_rev.Value := 'Y'
             ELSE
              dm.ADOQuery2current_rev.Value := 'N' ;
             IF  CheckBox2.Checked then
              dm.ADOQuery2nopb_flag.Value := 1
             ELSE
              dm.ADOQuery2nopb_flag.Value := 0;
             if  CheckBox3.Checked then
              dm.ADOQuery2REACH.Value:=true
             else
              dm.ADOQuery2REACH.Value:=false;

             DM.ADOQuery2memo_text.AsString := Memo1.Text ;

             DM.ADOQuery2remark.AsString := Memo4.Text ;
             DM.ADOQuery2eng_note.AsString := Memo5.Text ;

             dm.ADOQuery2OPT_LOT_SIZE.asstring := edit4.Text ;
             dm.ADOQuery2EST_SCRAP.AsString := edit9.Text  ;
             dm.ADOQuery2SHELF_LIFE.AsString := edit11.Text   ;
             dm.ADOQuery2MFG_LEAD_TIME.AsString := edit13.Text   ;

             dm.ADOQuery2ANALYSIS_CODE_3.AsString := edit17.Text ;

             DM.ADOQuery2.UpdateBatch();

             ADOQ0089.First;
             ADOQ0089.DisableControls ;
             while not ADOQ0089.Eof do
               begin
                 if ADOQ0089cust_part_ptr.IsNull then
                   begin
                    ADOQ0089.Edit ;
                    ADOQ0089cust_part_ptr.Value := dm.ADOQuery2rkey.Value;
                   end
                 else
                   if  ADOQ0089cust_part_ptr.Value <> dm.ADOQuery2rkey.Value then
                     begin
                       ADOQ0089.Edit ;
                       ADOQ0089cust_part_ptr.Value := dm.ADOQuery2rkey.Value;
                     end;
                 ADOQ0089.Next ;
               end;
             ADOQ0089.UpdateBatch();
             ADOQ0089.EnableControls ;

//---------注：为什么两个UPDATE语句不写到一起？？？
          with dm.TemADOQuery1 do        //更新第二层
           begin
            close;
            sql.Text:='update data0025'+#13+
                'set MANU_PART_DESC=Data0025_1.MANU_PART_DESC,'+#13+
                     'customer_ptr=Data0025_1.customer_ptr,'+#13+
                     'green_flag=Data0025_1.green_flag,'+
                     'CURRENT_REV=Data0025_1.CURRENT_REV,'+
                     'NOPB_flag= Data0025_1.NOPB_flag,'+#13+
                     'memo_text= Data0025_1.memo_text,'+#13+
                     'reach=Data0025_1.reach,ANALYSIS_CODE_2=Data0025_1.ANALYSIS_CODE_2,'+#13+
                     'ORIG_CUSTOMER= Data0025_1.ORIG_CUSTOMER'+#13+
            'FROM Data0025 INNER JOIN'+#13+
            'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
            'where Data0025_1.RKEY='+dm.ADOQuery2RKEY.AsString;
            ExecSQL;
           end;

          with dm.TemADOQuery1 do      //更新第三层
           begin
            close;
            sql.Text:='update data0025'+#13+
                     'set MANU_PART_DESC=Data0025_2.MANU_PART_DESC,'+#13+
                     'customer_ptr=Data0025_2.customer_ptr,'+#13+
                     'green_flag=Data0025_2.green_flag,'+
                     'CURRENT_REV=Data0025_2.CURRENT_REV,'+
                     'NOPB_flag= Data0025_2.NOPB_flag,'+#13+
                     'memo_text=Data0025_2.memo_text,'+#13+
                     'reach=Data0025_2.reach,ANALYSIS_CODE_2=Data0025_2.ANALYSIS_CODE_2,'+#13+
                     'ORIG_CUSTOMER= Data0025_2.ORIG_CUSTOMER'+#13+
              'FROM data0025 INNER JOIN  '+#13+
              'Data0025 Data0025_1 ON'+#13+
              'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
              'Data0025 Data0025_2 ON '+#13+
              'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
             'where Data0025_2.RKEY = '+dm.ADOQuery2RKEY.AsString;
            ExecSQL;
           end;


          with dm.TemADOQuery1 do      //更新第四层
           begin
            close;
            sql.Text:='update data0025'+#13+
                     'set MANU_PART_DESC=Data0025_3.MANU_PART_DESC,'+#13+
                         'customer_ptr=Data0025_3.customer_ptr,'+#13+
                         'green_flag=Data0025_3.green_flag,'+
                         'CURRENT_REV=Data0025_3.CURRENT_REV,'+
                         'NOPB_flag= Data0025_3.NOPB_flag,'+#13+
                         'memo_text=Data0025_3.memo_text,'+#13+
                         'reach=Data0025_3.reach,ANALYSIS_CODE_2=Data0025_3.ANALYSIS_CODE_2,'+#13+
                         'ORIG_CUSTOMER= Data0025_3.ORIG_CUSTOMER'+#13+
              'FROM data0025 INNER JOIN  '+#13+
              'Data0025 Data0025_1 ON'+#13+
              'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
              'Data0025 Data0025_2 ON '+#13+
              'Data0025_1.PARENT_PTR = Data0025_2.RKEY inner join'+#13+
              'Data0025 Data0025_3 ON '+#13+
              'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
             'where Data0025_3.RKEY = '+dm.ADOQuery2RKEY.AsString;
            ExecSQL;
           end;
          DM.ADOConnection1.CommitTrans ;
         EXCEPT
          on e :exception do
           begin
            DM.ADOConnection1.RollbackTrans ;
            showmessage(e.Message);
            exit;
           end;
         END;
      END;
  self.ModalResult:=mrok;
  end;
  QueryTmp1.Free;
end;

procedure TAddEditForm1.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'CUST_CODE/客户代码/100,ABBR_NAME/客户简称/100,CUSTOMER_NAME/客户名称/200';
    InputVar.Sqlstr := 'select RKEY,CUST_CODE,ABBR_NAME,CUSTOMER_NAME,ANALYSIS_CODE3 from data0010 '+
                       'order by CUST_CODE';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      vrkey0010 :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edit1.Text := frmPick_Item_Single.adsPick.FieldValues['CUST_CODE'];
      Label4.Caption := frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME'];
      CODE3:= frmPick_Item_Single.adsPick.Fieldbyname('ANALYSIS_CODE3').AsString;
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

function TAddEditForm1.Add_ADOQ0089(const groupptr2:string): boolean;
begin
  result := false;
  dm.TemADOQuery1.Close ;
  dm.TemADOQuery1.SQL.Clear;
  dm.TemADOQuery1.SQL.Add('SELECT Data0087.RKEY, Data0087.PARAMETER_PTR,Data0087.SEQ_NO, Data0087.group_ptr, Data0087.ttype');
  dm.TemADOQuery1.SQL.Add('FROM Data0087 INNER JOIN Data0007 ON Data0087.group_ptr = Data0007.RKEY INNER JOIN');
  dm.TemADOQuery1.SQL.Add('Data0008 ON Data0007.RKEY = Data0008.PR_GRP_POINTER');
  dm.TemADOQuery1.SQL.Add('WHERE (Data0008.RKEY = ' +groupptr2+') ORDER BY Data0087.SEQ_NO');
  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;

  if not dm.TemADOQuery1.IsEmpty then
      begin
       dm.TemADOQuery1.First;
       ADOQ0089.DisableControls ;
       DataSource1.DataSet := nil;
       while not dm.TemADOQuery1.Eof do
          begin
            ADOQ0089.Append ;
            ADOQ0089parameter_ptr.Value := dm.TemADOQuery1.FieldValues['PARAMETER_PTR'];
            ADOQ0089tvalue.Value := '';
            ADOQ0089cust_part_ptr.Value := dm.ADOQuery2RKEY.Value ;
            dm.TemADOQuery1.Next ;
          end ;
       DataSource1.DataSet := ADOQ0089;
       ADOQ0089.EnableControls ;
      end ;

  dm.TemADOQuery1.Close ;
  result := true;
end;

function TAddEditForm1.ChangeProdCodeValue(const vvalue: integer): boolean;
begin
  result := false;
  if dm.TemADOQuery1.Active then dm.TemADOQuery1.close;
  dm.TemADOQuery1.SQL.Clear ;
  dm.TemADOQuery1.SQL.Add('select LEAD_TIME,OPT_LOT_SIZE,MAX_DAYS_EARLY_BUILD,EST_SCRAP,');
  DM.TemADOQuery1.SQL.Add('EST_SCRAP1,REVIEW_DAYS from data0008 where rkey = ' +inttostr(vvalue));
  dm.TemADOQuery1.Open ;

  edit4.Text := dm.TemADOQuery1.FieldByName('OPT_LOT_SIZE').AsString ;
  if RadioGroup1.ItemIndex = 0 then
   edit9.Text := dm.TemADOQuery1.FieldByName('EST_SCRAP').AsString
  else
   edit9.Text := dm.TemADOQuery1.FieldByName('EST_SCRAP1').AsString ;

  edit11.Text := dm.TemADOQuery1.FieldByName('LEAD_TIME').AsString ;
  edit13.Text := dm.TemADOQuery1.FieldByName('MAX_DAYS_EARLY_BUILD').AsString ;
  Edit19.Text := dm.TemADOQuery1.FieldByName('REVIEW_DAYS').AsString ;
  result := true;
  dm.TemADOQuery1.Close ;

end;

procedure TAddEditForm1.BitBtn9Click(Sender: TObject);
var
  InputVar: PDlgInput ;

begin
  if (radiogroup1.ItemIndex < 0) or (trim(edit18.Text)='')
    or (trim(edit1.Text)='') then
   begin
   showmsg('请首先确定工厂及产品性质',1);
    exit;
   end;

   if AddEditForm1.Caption ='编辑' then
   begin
     frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    try
      InputVar.Fields := 'PROD_CODE/产品类别代码/200,PRODUCT_NAME/产品类别名称/200';
      InputVar.Sqlstr := 'select RKEY,PROD_CODE,PRODUCT_NAME,IESMODEL_PTR,REVIEW_DAYS '+
      'from data0008 order by prod_code';
       InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar) ;
      if frmPick_Item_Single.ShowModal=mrok then
       begin
       if vrkey0008 <> frmPick_Item_Single.adsPick.FieldValues['RKEY'] then
         begin
           vrkey0008 :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
           edit5.Text := frmPick_Item_Single.adsPick.FieldValues['PROD_CODE'];
           Label5.Caption := frmPick_Item_Single.adsPick.FieldValues['PRODUCT_NAME'];
           if frmPick_Item_Single.adsPick.FieldByName('IESMODEL_PTR').IsNull then
            vrkey0504 := -9999
           else
            vrkey0504 := frmPick_Item_Single.adsPick.FieldValues['IESMODEL_PTR']  ;

           if CheckBox1.Checked then
            if (VMyEditMode = 0) and (RadioGroup1.ItemIndex <> -1) then
              edit2.Text := NewProject2(vrkey0008,self.vrkey0015);
           ChangeProdCodeValue(vrkey0008);
           radiogroup1.Enabled:=false;
           edit18.Enabled:=false;
           bitbtn4.Enabled:=false;
         end ;
      end;
     finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
     end;
   end
   else
  begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'PROD_CODE/产品类别代码/200,PRODUCT_NAME/产品类别名称/200';
    InputVar.Sqlstr := 'select RKEY,PROD_CODE,PRODUCT_NAME,IESMODEL_PTR,REVIEW_DAYS '+
    'from data0008 order by prod_code';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
       if vrkey0008 <> frmPick_Item_Single.adsPick.FieldValues['RKEY'] then
         begin
           vrkey0008 :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
           edit5.Text := frmPick_Item_Single.adsPick.FieldValues['PROD_CODE'];
           Label5.Caption := frmPick_Item_Single.adsPick.FieldValues['PRODUCT_NAME'];
           if frmPick_Item_Single.adsPick.FieldByName('IESMODEL_PTR').IsNull then
            vrkey0504 := -9999
           else
            vrkey0504 := frmPick_Item_Single.adsPick.FieldValues['IESMODEL_PTR']  ;

           ADOQ0089.First ;
           while not ADOQ0089.Eof do ADOQ0089.Delete ;

           if ADOQ0089.IsEmpty then
               Add_ADOQ0089(inttostr(vrkey0008));

           if CheckBox1.Checked then
            if (VMyEditMode = 0) and (RadioGroup1.ItemIndex <> -1) then
              edit2.Text := NewProject2(vrkey0008,self.vrkey0015);
           ChangeProdCodeValue(vrkey0008);
           radiogroup1.Enabled:=false;
           edit18.Enabled:=false;
           bitbtn4.Enabled:=false;
         end ;
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
 end;

end;

procedure TAddEditForm1.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
  //showmessage('a'+' '+Edit16.Text+'  '+Edit16.SelText+'  ' +inttostr(Edit16.SelStart)+'  ' +inttostr(Edit16.SelLength));
  if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //Key := #0 ;
          exit;
      end;
  vEdit18Text := Edit16.Text ;
end;

procedure TAddEditForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      if (self.ActiveControl.ClassName <> 'TMemo')
        and (self.ActiveControl.ClassName <> 'TDBGrid')
        and (self.ActiveControl.ClassName <> 'TDateTimePicker')
        and (activecontrol.Name<>'DBComboBox1')
        then
           begin
             key:=#0;
             perform(wm_nextdlgctl,0,0);
           end ;
    end;
end;

procedure TAddEditForm1.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)='' then
    BEGIN
      vrkey0010 := 0 ;
      Label4.Caption := '' ;
      exit ;
    END ;
  if ActiveControl =bitbtn3 then exit;
  if ActiveControl =bitbtn2 then exit;

  if dm.TemADOQuery1.Active then dm.TemADOQuery1.Close ;
  dm.TemADOQuery1.SQL.Clear;
  dm.TemADOQuery1.SQL.Add('select RKEY,CUST_CODE,CUSTOMER_NAME,ANALYSIS_CODE3');
  dm.TemADOQuery1.SQL.Add('from Data0010 where CUST_CODE ='''+edit1.Text+'''');
  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;
  if dm.TemADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到该客户代号！',mtinformation,[mbok],0);
      edit1.SetFocus ;
    end
  else
    begin
       vrkey0010 :=  dm.TemADOQuery1.FieldValues['RKEY'];
       edit1.Text := dm.TemADOQuery1.FieldValues['CUST_CODE'];
       Label4.Caption := dm.TemADOQuery1.FieldValues['CUSTOMER_NAME'];
       CODE3:=  dm.TemADOQuery1.Fieldbyname('ANALYSIS_CODE3').AsString;
    end;
  dm.TemADOQuery1.Close ;
end;

procedure TAddEditForm1.Edit15KeyPress(Sender: TObject; var Key: Char);
begin

  if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //key := #0;
          exit;
      end;
  vEdit18Text := Edit15.Text ;
end;

procedure TAddEditForm1.Edit14KeyPress(Sender: TObject; var Key: Char);
begin

  if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //key := #0 ;
          exit;
      end;
  vEdit18Text := Edit14.Text ;
end;

procedure TAddEditForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //key := #0;
          exit;
      end;
  vEdit18Text := Edit7.Text ;
end;

procedure TAddEditForm1.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if (pos(key,'0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //key := #0;
          exit;
      end;
end;

procedure TAddEditForm1.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if (pos(key,'0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
      end;
end;

procedure TAddEditForm1.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if (pos(key,'0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //key := #0;
          exit;
      end;
end;

procedure TAddEditForm1.Edit5Exit(Sender: TObject);
begin
  if trim(edit5.Text)='' then
    BEGIN
     vrkey0008 := 0 ;
     Label5.Caption := '' ;
     if (VMyEditMode = 0) then
     begin
      radiogroup1.Enabled:=true;
      edit18.Enabled:=true;
      bitbtn4.Enabled:=true;
      edit2.Text:='';
     end;
     exit ;
    END ;
  if ActiveControl =bitbtn9 then exit;
  if ActiveControl =bitbtn2 then exit;

  dm.TemADOQuery1.Close ;
  dm.TemADOQuery1.SQL.Clear;
  dm.TemADOQuery1.SQL.Add('select RKEY,PROD_CODE,PRODUCT_NAME,IESMODEL_PTR,REVIEW_DAYS');
  DM.TemADOQuery1.SQL.Add('from Data0008 where PROD_CODE ='''+edit5.Text+'''');
  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;
  if dm.TemADOQuery1.IsEmpty then
    begin
     messagedlg('没有找到该产品类别代号！',mtinformation,[mbok],0);
     edit5.SetFocus ;
    end
  else
    begin
      vrkey0008 :=  dm.TemADOQuery1.FieldValues['RKEY'];
      edit5.Text := dm.TemADOQuery1.FieldValues['PROD_CODE'];
      Label5.Caption := dm.TemADOQuery1.FieldValues['PRODUCT_NAME'];
      if dm.TemADOQuery1.FieldByName('IESMODEL_PTR').IsNull then
       vrkey0504 := -9999
      else
       vrkey0504 := dm.TemADOQuery1.FieldValues['IESMODEL_PTR'];

       ADOQ0089.First ;
       while not ADOQ0089.Eof do ADOQ0089.Delete ;

       if ADOQ0089.IsEmpty then
         Add_ADOQ0089(inttostr(vrkey0008));

      if CheckBox1.Checked then
       if (VMyEditMode = 0) and (RadioGroup1.ItemIndex <> -1) then
         edit2.Text := NewProject2(vrkey0008,self.vrkey0015);

      ChangeProdCodeValue(vrkey0008);

      radiogroup1.Enabled:=false;
      edit18.Enabled:=false;
      bitbtn4.Enabled:=false;
    end;
  dm.TemADOQuery1.Close ;
end;

function TAddEditForm1.Get_MyEditMode: integer;
begin
  result := VMyEditMode ;
end;

procedure TAddEditForm1.sET_MyEditMode(const Value: integer);
begin
  VMyEditMode := value ;
end;

function TAddEditForm1.Get_Myuser_ptrCaption: integer;
begin
  result := vuser_ptr;
end;

procedure TAddEditForm1.Set_Myuser_ptrCaption(const Value: integer);
begin
  vuser_ptr := value ;
end;

procedure TAddEditForm1.FormShow(Sender: TObject);
var
  s:string;
begin
   //显示工程更改内容
   if dm.TemADOQuery1.Active then dm.TemADOQuery1.Close ;
   dm.TemADOQuery1.SQL.Clear ;
   dm.TemADOQuery1.SQL.Add('SELECT Data0273.text, Data0273.remark, Data0273.VERIFIED_BY,');
   dm.TemADOQuery1.SQL.Add('Data0273.ENTERED_BY, Data0273.ENTERED_DATE,');
   dm.TemADOQuery1.SQL.Add('Data0273.VERIFIED_DATE, Data0273.SOURCE,');
   dm.TemADOQuery1.SQL.Add('Data0005.EMPLOYEE_NAME AS inputman_name,');
   dm.TemADOQuery1.SQL.Add('Data0005_1.EMPLOYEE_NAME AS checkman_name,');
   dm.TemADOQuery1.SQL.Add('Data0273.CUSTOMER_PART_PTR, Data0025.MANU_PART_NUMBER,Data0273.ECN_NO');
   dm.TemADOQuery1.SQL.Add('FROM Data0273 LEFT OUTER JOIN Data0025 ON');
   dm.TemADOQuery1.SQL.Add('Data0273.CUSTOMER_PART_PTR = Data0025.RKEY LEFT OUTER JOIN');
   dm.TemADOQuery1.SQL.Add('Data0005 ON Data0273.ENTERED_BY = Data0005.RKEY LEFT OUTER JOIN');
   dm.TemADOQuery1.SQL.Add('Data0005 Data0005_1 ON Data0273.VERIFIED_BY = Data0005_1.RKEY');

   if VMyEditMode = 0 then //新增
    s :='WHERE Data0273.CUSTOMER_PART_PTR is null and Data0273.COPYFROMCUST_PTR is null'  // and data0273.del=0'
   else //编辑与检查
    s :='WHERE Data0273.CUSTOMER_PART_PTR = '+ dm.ADOQuery1rkey.AsString;// +' and data0273.del=0';

   dm.TemADOQuery1.SQL.Add(s);
   dm.TemADOQuery1.Open ;

   Memo2.Text := dm.TemADOQuery1.FieldByName('text').AsString;
   Memo3.Text := dm.TemADOQuery1.FieldByName('remark').AsString;
   Label19.Caption :=Label19.Caption + dm.TemADOQuery1.FieldByName('inputman_name').AsString;
   Label21.Caption :=Label21.Caption + dm.TemADOQuery1.FieldByName('ENTERED_DATE').AsString;
   Label22.Caption :=Label22.Caption + dm.TemADOQuery1.FieldByName('checkman_name').AsString;
   Label23.Caption :=Label23.Caption + dm.TemADOQuery1.FieldByName('VERIFIED_DATE').AsString;
   Label24.Caption :=Label24.Caption + dm.TemADOQuery1.FieldByName('MANU_PART_NUMBER').AsString;
   Label25.Caption :=Label25.Caption + dm.TemADOQuery1.FieldByName('ECN_NO').AsString;
   if not dm.TemADOQuery1.FieldByName('SOURCE').IsNull then
    RadioGroup3.ItemIndex := dm.TemADOQuery1.FieldByName('SOURCE').AsInteger;
   dm.TemADOQuery1.Close ;

   vs2 := false ;     //没有修改
   vrkey0008 := 0 ;
   if dm.ADOQuery2.Active then
       begin
        edit2.Text := dm.ADOQuery2MANU_PART_NUMBER.Value ;
        edit2.MaxLength := dm.ADOQuery2MANU_PART_NUMBER.Size ;

        edit3.Text := dm.ADOQuery2MANU_PART_DESC.Value ;
        edit3.MaxLength := dm.ADOQuery2MANU_PART_DESC.Size ;

        edit6.Text := dm.ADOQuery2SAMPLE_NR.Value ;
        edit6.MaxLength  := dm.ADOQuery2SAMPLE_NR.Size ;
        if not dm.adoquery2ttype.IsNull then
            RadioGroup1.ItemIndex := dm.adoquery2ttype.value;

        IF TRIM(DM.ADOQUERY2SO_UNIT.AsString) = 'SET' THEN
            RadioGroup2.ItemIndex := 1
        ELSE
          IF TRIM(DM.ADOQUERY2SO_UNIT.AsString) = 'PCS' THEN
            RadioGroup2.ItemIndex := 2
          ELSE
            RadioGroup2.ItemIndex := 0 ;

        if dm.ADOQuery2pricing_principle.AsString = '0' then
          rg1.ItemIndex := 0
        else
        if dm.ADOQuery2pricing_principle.AsString = '1' then
          rg1.ItemIndex := 1;

        edit12.Text := dm.ADOQuery2LAYERS.AsString ;
        edit10.Text := dm.ADOQuery2set_qty.AsString ;

        if edit10.Text = '' then edit10.Text := '1' ;
        edit7.Text := dm.ADOQuery2set_lngth.AsString ;

        edit14.Text := dm.ADOQuery2set_width.AsString ;

        edit15.Text := dm.ADOQuery2pcs_lngth.AsString ;

        edit16.Text := dm.ADOQuery2pcs_width.AsString ;

        Edit22.Text := dm.ADOQuery2RFQNo.AsString ;

        Edit23.Text := dm.ADOQuery2ORIG_CUSTOMER.AsString ;

        if edit7.Text = '' then edit7.Text := '0' ;
        if edit14.Text = '' then edit14.Text := '0' ;
        if edit15.Text = '' then edit15.Text := '0' ;
        if edit16.Text = '' then edit16.Text := '0' ;

        edit8.Text := dm.ADOQuery2ANALYSIS_CODE_2.AsString ;
        edit8.MaxLength := dm.ADOQuery2ANALYSIS_CODE_2.Size ;

        if dm.ADOQuery2green_flag.AsString = 'Y' THEN
          RadioButton1.Checked := TRUE
        else
          RadioButton1.Checked := FALSE ;

         current_ck.Checked:= trim(dm.ADOQuery2current_rev.Value) = 'Y';
         CheckBox2.Checked:= dm.ADOQuery2nopb_flag.Value=1;
         CheckBox3.Checked:= dm.ADOQuery2REACH.Value=true;

        Memo1.Text := DM.ADOQuery2memo_text.AsString ;
        Memo4.Text := DM.ADOQuery2remark.AsString ;
        Memo5.Text := DM.ADOQuery2eng_note.AsString ;
        Memo5.MaxLength := DM.ADOQuery2memo_text.Size ;

        edit17.Text := dm.ADOQuery2ANALYSIS_CODE_3.AsString ;
        edit17.MaxLength  := dm.ADOQuery2ANALYSIS_CODE_3.Size ;

        if not dm.ADOQuery2PROD_CODE_PTR.IsNull then
            vrkey0008 := dm.ADOQuery2PROD_CODE_PTR.Value ;

        if not dm.ADOQuery2OPT_LOT_SIZE.IsNull then
            edit4.Text := dm.ADOQuery2OPT_LOT_SIZE.asstring ;
        if not dm.ADOQuery2EST_SCRAP.IsNull then
            edit9.Text := dm.ADOQuery2EST_SCRAP.AsString ;
        if not dm.ADOQuery2SHELF_LIFE.IsNull then
            edit11.Text := dm.ADOQuery2SHELF_LIFE.AsString ;
        if not dm.ADOQuery2MFG_LEAD_TIME.IsNull then
            edit13.Text := dm.ADOQuery2MFG_LEAD_TIME.AsString ;
        Edit19.Text:= dm.ADOQuery2REVIEW_DAYS.AsString;
        if not dm.ADOQuery2ENG_ROUTE_PTR.IsNull then
            vrkey0504 := dm.ADOQuery2ENG_ROUTE_PTR.value
        else
            vrkey0504 := -9999;

        if VMyEditMode <> 2 then
         if RadioGroup2.ItemIndex = 2 then
          begin
           //edit7.Enabled := false ;
           //edit14.Enabled := false ;
           edit7.Color := clGradientActiveCaption;
           edit14.Color := clGradientActiveCaption ;
          end
         else
          begin
           edit7.Enabled := true ;
           edit14.Enabled := true ;
           edit7.Color := clWindow ;
           edit14.Color :=  clWindow ;
          end ;
        dm.ADOQ02780002.Open;
        ADOQ0089.Close ;
        ADOQ0089.Parameters.ParamValues['reky0025'] := dm.ADOQuery2rkey.AsVariant;
        ADOQ0089.Open ;

        if edit5.Text <> '' then   //已有产品类别
         if ADOQ0089.IsEmpty then    //为空记录
          Add_ADOQ0089(dm.ADOQuery2PROD_CODE_PTR.AsString);
       end;

   vs2 := true;
   if VMyEditMode = 3 then   //只编辑客户型号
     begin
       RadioGroup1.Enabled := false;
       Edit1.ReadOnly := true;
       BitBtn3.Enabled := false;
       //Edit23.ReadOnly := true;
       //BitBtn5.Enabled := false;
       Edit5.ReadOnly := true;
       BitBtn9.Enabled := false;
       CheckBox1.Enabled := false;
       Edit2.ReadOnly := true;

       Edit12.ReadOnly := true;
       Edit10.ReadOnly := true;
//       Edit15.ReadOnly := true;
//       Edit16.ReadOnly := true;
//       Edit7.ReadOnly := true;
//       Edit14.ReadOnly := true;
       Memo1.ReadOnly := false;
       Memo4.ReadOnly := true;
       Memo5.ReadOnly := true;
       dbGrid1.ReadOnly := true;        //评审能数不能修改
       //DBComboBox1.ReadOnly := true;
       //RadioGroup2.Enabled := false;
       RadioButton1.Enabled := false;
       current_ck.Enabled := false;
       CheckBox2.Enabled := false;
       CheckBox3.Enabled :=false;
       Edit18.Enabled:=false;
       BitBtn4.Enabled:=false;

       Edit1.Color := clSkyBlue ;
       //Edit23.Color := clSkyBlue ;       
       Edit5.Color := clSkyBlue ;
       Edit8.Enabled:=vprev='4';
       Edit10.Color := clSkyBlue ;
       Edit15.Color := clSkyBlue ;
       Edit16.Color := clSkyBlue ;
       Edit7.Color := clSkyBlue ;
       Edit14.Color := clSkyBlue ;
       Edit12.Color := clSkyBlue ;
     end;

if dm.ADOQuery2prod_route_ptr.Value>0 then
begin
 dm.TemADOQuery1.Close;
 dm.TemADOQuery1.SQL.Text:=
    'SELECT dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME'+#13+
    'FROM dbo.Data0015'+#13+
     'where data0015.rkey='+dm.ADOQuery2prod_route_ptr.AsString;
 dm.TemADOQuery1.Open;
 if not dm.TemADOQuery1.IsEmpty then
 begin
  self.vrkey0015:=dm.ADOQuery2prod_route_ptr.Value;
  edit18.Text := dm.TemADOQuery1.FieldValues['WAREHOUSE_CODE'];
  Label34.Caption := dm.TemADOQuery1.FieldValues['WAREHOUSE_NAME'];
 end;
end;

rg1.Enabled := RadioGroup2.Enabled;
if VMyEditMode = 3 then rg1.Enabled := True;

end;

function TAddEditForm1.Get_Myrkey0008: integer;
begin
  result := vrkey0008 ;
end;

function TAddEditForm1.Get_Myrkey0010: integer;
begin
  result := vrkey0010 ;
end;

procedure TAddEditForm1.sET_Myrkey0008(const Value: integer);
begin
  vrkey0008 := value ;
end;

procedure TAddEditForm1.sET_Myrkey0010(const Value: integer);
begin
  vrkey0010 := value ;
end;

procedure TAddEditForm1.Edit1Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit5Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.RadioGroup1Click(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
   BitBtn1.Enabled  := true ;

  ChangeProdCodeValue(vrkey0008);
  if CheckBox1.Checked then
    if (edit2.Text = '') and (edit5.Text <> '') then
      begin
       edit2.Text := NewProject2(vrkey0008,self.vrkey0015);
      end;
end;

procedure TAddEditForm1.Edit2Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit3Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit6Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit12Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.RadioGroup2Click(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
//  if RadioGroup2.ItemIndex = 2 then
//      begin
//          edit10.Text := '1';
////           edit7.Text := edit15.Text ;
////           edit14.Text := edit16.Text ;
//           //edit7.Enabled := True ;
//           //edit14.Enabled := True ;
//           //edit7.Color := clGradientActiveCaption;
//           //edit14.Color := clGradientActiveCaption ;
//      end
//  else
//      begin
//           edit7.Enabled := true ;
//           edit14.Enabled := true ;
//           edit7.Color := clWindow ;
//           edit14.Color :=  clWindow ;
//      end ;
end;

procedure TAddEditForm1.Edit10Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit7Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      //BitBtn1.Enabled  := true ;
      begin
          try
              if trim(edit7.Text) <>'' then
                  strtofloat(edit7.Text);
              BitBtn1.Enabled  := true ;
          except
              edit7.Text := vEdit18Text ;
          end;
      end ;
end;

procedure TAddEditForm1.Edit14Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      begin
          try
              if trim(edit14.Text) <>'' then
                  strtofloat(edit14.Text) ;
              BitBtn1.Enabled  := true ;
          except
              edit14.Text := vEdit18Text ;
          end;
      end ;
end;

procedure TAddEditForm1.Edit15Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      //BitBtn1.Enabled  := true ;
      begin
          try
              if trim(edit15.Text) <>'' then
                  strtofloat(edit15.Text);
              BitBtn1.Enabled  := true ;
          except
              edit15.Text := vEdit18Text ;
          end;
      end ;
//  if RadioGroup2.ItemIndex = 2 then
//   begin
//    edit7.Text := edit15.Text ;
//   end ;
end;

procedure TAddEditForm1.Edit16Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      begin
          try
              if trim(edit16.Text) <>'' then
                  strtofloat(edit16.Text);
              BitBtn1.Enabled  := true ;
          except
              edit16.Text := vEdit18Text ;
          end;
      end ;
//  if RadioGroup2.ItemIndex = 2 then
//      begin
//           edit14.Text := edit16.Text ;
//      end ;

  //
end;

procedure TAddEditForm1.Edit8Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.RadioButton1Click(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.CheckBox1Click(Sender: TObject);
begin
   edit2.Enabled := not CheckBox1.Checked ;
   if edit2.Enabled then
       edit2.Color := clWindow
   else
       edit2.Color := clSkyBlue ; // clGradientActiveCaption

  if CheckBox1.Checked then
    if (edit2.Text = '') and (edit5.Text <> '') AND
       ( RadioGroup1.ItemIndex <> -1 ) then
       edit2.Text := NewProject2(vrkey0008,self.vrkey0015);
end;

procedure TAddEditForm1.Memo1Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;



procedure TAddEditForm1.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
   //showmessage('1');
end;

function TAddEditForm1.NewProject2(PROD_CODE_PTR2,whouse_ptr : integer): string;
var
  s:string ;
begin
  result := '' ;
  v81PRECHAR1 := '';
  v81PRECHAR2 := '';

  dm.TemADOQuery1.Close;
  dm.TemADOQuery1.SQL.Text := 'select part_batch,part_templet from data0015 '+
                              'where rkey='+inttostr(whouse_ptr);
  dm.TemADOQuery1.Open;
  v81PRECHAR1:=dm.TemADOQuery1.fieldbyname('part_batch').AsString;
  v81PRECHAR2:=dm.TemADOQuery1.fieldbyname('part_templet').AsString;

  dm.TemADOQuery1.Close;
  dm.TemADOQuery1.SQL.Text := 'select CUSTSTATOOL,CUSTSTASHIP from data0192';
  dm.TemADOQuery1.Open;     //如果本厂编号中增加客户识别码
  if dm.TemADOQuery1.fieldbyname('CUSTSTATOOL').AsString='Y' then
   begin
    v81PRECHAR1:=v81PRECHAR1+self.CODE3;
    v81PRECHAR2:=v81PRECHAR2+self.CODE3;
   end;

  dm.ADOQ0008.Close ;
  dm.ADOQ0008.Parameters.ParamValues['reky0008'] := PROD_CODE_PTR2 ;
  dm.ADOQ0008.Prepared ;
  dm.ADOQ0008.Open ;
  v81PRECHAR1 := v81PRECHAR1 + trim(dm.ADOQ0008PRECHAR1.AsString);
  v81PRECHAR2 := v81PRECHAR2 + trim(dm.ADOQ0008PRECHAR2.AsString);

  if not dm.ADOQ0008.IsEmpty  then
   begin
    dm.ADOQ0081.Close;
    dm.ADOQ0081.Parameters.ParamValues['layer_pre'] := dm.ADOQ0008layer_pre.AsInteger  ;
    dm.ADOQ0081.Prepared ;
    dm.ADOQ0081.Open ;
    if not dm.ADOQ0081.IsEmpty then
      begin
       v81sufchar :=  trim(dm.ADOQ0081sufchar.AsString);
       if UpperCase(DM.TemADOQuery1.FieldByName('CUSTSTASHIP').AsString) = 'Y' then
       begin
         if RadioGroup1.ItemIndex = 0 then
          s := v81sufchar + v81PRECHAR1
         else
          s := v81sufchar + v81PRECHAR2;
       end else
       begin
         if RadioGroup1.ItemIndex = 0 then
          s := v81PRECHAR1 + v81sufchar
         else
          s := v81PRECHAR2 +v81sufchar;
       end;
      end
    else
     s:='';
   end;
  if s <> '' then  result := s + rev2 ;

end;

function TAddEditForm1.ProjectToNumber(const Project2: string;var p2:string; var value2,
                                       Number2: integer): boolean;
var
  i,i2,in2:integer;
  s : string;
begin
  result := false ;
  s := Project2 ;
  in2 := length(s);
  Number2 := in2 ;
  for i := in2 downto 1 do
      begin
          if not(s[i] in ['0','1','2','3','4','5','6','7','8','9']) then
              begin
                  //showmessage(s[i]) ;
                  Number2 := i ;
                  break ;
               end ;
      end ;

  if Number2 = in2 then
      value2 := 0
  else
     value2 := strtoint(copy(s,Number2 + 1,in2 - Number2 )) ;

  p2 := copy(s,1,Number2 ) ;


  result := true ;
end;



procedure TAddEditForm1.ADOQ0089AfterScroll(DataSet: TDataSet);
begin
  if ADOQ0089.Active then
  begin
    DM.ADOQ0338.Close;
    dm.ADOQ0338.Parameters.ParamValues['rkey0278'] := ADOQ0089parameter_ptr.Value ;
    dm.ADOQ0338.Open ;
    DBGrid1.Columns[3].PickList.Clear;
    while not dm.ADOQ0338.eof do
    begin
      DBGrid1.Columns[3].PickList.Add(trim(dm.ADOQ0338.FieldValues['tvalue']));
      dm.ADOQ0338.Next;
    end;
  end;

//if ADOQ0089.Active then
// begin
//
//  if dm.ADOQ0338.Active then dm.ADOQ0338.Close;
//  if not ADOQ0089parameter_ptr.IsNull then
//    begin
//     dm.ADOQ0338.Parameters.ParamValues['rkey0278'] := ADOQ0089parameter_ptr.Value ;
//     dm.ADOQ0338.Open ;
//    end ;
//    if not dm.ADOQ0338.IsEmpty then
//     begin
//      DBComboBox1.Items.Clear;
//      while not dm.ADOQ0338.eof do
//       begin
//        DBComboBox1.Items.Add(trim(dm.ADOQ0338.FieldValues['tvalue']));
//        dm.ADOQ0338.Next;
//       end;
//     end
//    else
//     DBComboBox1.Items.Clear;
//    if dbcombobox1.Items.Count > 0 then
//     DBComboBox1.Visible := True
//    else
//     DBComboBox1.Visible := false;
// end ;
end;

function TAddEditForm1.CheckCustCode2(const CustCode2: string): boolean;
begin
  result := false ;
  if dm.TemADOQuery1.Active then dm.TemADOQuery1.Close;
  dm.TemADOQuery1.SQL.Clear ;
  dm.TemADOQuery1.SQL.Add('select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010 where CUST_CODE ='''+edit1.Text+'''');

  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;
  if dm.TemADOQuery1.IsEmpty then
      result := true
  else
      result := false ;
  dm.TemADOQuery1.Close ;
end;


{
procedure TAddEditForm1.Abort3;
  function ReturnAddr: Pointer;
  asm
    MOV  EAX,[EBP + 4]
  end;
begin
  raise EAbort.CreateRes(@SOperationAborted) at ReturnAddr;
end;
}

function TAddEditForm1.AddOne_1: boolean;
var
 s:string ;
 len:integer;
begin
 { if RadioGroup1.ItemIndex = 0 then
    begin
     s := copy(edit2.Text,length(v81PRECHAR1)+1,length(trim(edit2.Text))-length(v81PRECHAR1)-2)  ;
    end
  else
   if RadioGroup1.ItemIndex = 1 then
    begin
     s := copy(edit2.Text,length(v81PRECHAR2)+1,length(trim(edit2.Text))-length(v81PRECHAR1)-2)  ;
    end ;
  s2 := inttostr(strtoint(s)+ 1) ;
  s := copy(s,1,length(s)-length(s2)) + s2 ;
  }
  if not dm.ADOQ0081.IsEmpty then
    begin
     len:=length(v81sufchar);
     s :=StringofChar('0',len-length(inttostr(strtoint(v81sufchar)+1)))+
     inttostr(strtoint(v81sufchar)+1);
     dm.ADOQ0081.Edit ;
     dm.ADOQ0081sufchar.Value := s ;
    end;
end;

function TAddEditForm1.AddOne_2: boolean;
var
  s:string ;
  b2:boolean;
begin
  b2 := true;
  while b2 do
    begin
      s := inttostr(strtoint(v81sufchar)+ 1) ;
      v81sufchar := copy(v81sufchar,1,length(v81sufchar)-length(s)) + s ;

      if dm.TemADOQuery1.Active then dm.TemADOQuery1.Close;
      dm.TemADOQuery1.SQL.Clear ;
      dm.TemADOQuery1.SQL.Add('select rkey from data0025 where MANU_PART_NUMBER ='''+v81PRECHAR1+v81sufchar+rev2+''''+' or MANU_PART_NUMBER ='''+v81PRECHAR2+v81sufchar+rev2+'''');
      dm.TemADOQuery1.Prepared ;
      dm.TemADOQuery1.Open ;
      if dm.TemADOQuery1.IsEmpty then
        BEGIN
          b2 := false ;
          if RadioGroup1.ItemIndex = 0 then
           edit2.Text := v81PRECHAR1 + v81sufchar + rev2
          else
           edit2.Text := v81PRECHAR2 + v81sufchar + rev2 ;
        end
      else
        begin
        end;
      dm.TemADOQuery1.Close;
    end;
end;

procedure TAddEditForm1.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
try
 InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/60,WAREHOUSE_NAME/工厂名称/250,abbr_name/工厂简称/100';
 InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,abbr_name from data0015 '+
                    'order by WAREHOUSE_CODE';
 InputVar.AdoConn := DM.ADOConnection1;
 frmPick_Item_Single.InitForm_New(InputVar);
if frmPick_Item_Single.ShowModal=mrok then
 begin
  vrkey0015 := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
  edit18.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
  Label34.Caption := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME'];
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;
end;

procedure TAddEditForm1.Edit18Exit(Sender: TObject);
begin
if trim(edit18.Text)='' then
 begin
  label34.Caption:='';
  self.vrkey0015:=0;
 end
else
 if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn2') then
 begin
  with dm.TemADOQuery1 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where WAREHOUSE_CODE='+quotedstr(trim(edit18.Text));
   open;
   if isempty then
    begin
     messagedlg('工厂代码输入错误!',mterror,[mbcancel],0);
     edit18.SetFocus;
    end
   else
    begin
     self.vrkey0015:=fieldbyname('RKEY').AsInteger;
     label34.Caption:=fieldbyname('WAREHOUSE_NAME').AsString;
    end;
   close; 
  end;
 end;
end;

procedure TAddEditForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if (radiogroup1.ItemIndex < 0) or (trim(edit18.Text)='')
or (trim(edit1.Text)='') then
 begin
  showmsg('请首先确定工厂,产品性质及客户代码',1);
  abort;
 end;
end;

procedure TAddEditForm1.DBGrid1CellClick(Column: TColumn);
begin
//if column.Index<3 then dbgrid1.SelectedIndex:=3;
end;

procedure TAddEditForm1.DBGrid1ColExit(Sender: TObject);
begin
//If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
// DBComboBox1.Visible := false;
end;

procedure TAddEditForm1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//if (gdFocused in State) then
// begin
//  if (column.FieldName = DBComboBox1.DataField ) then
//   begin
//    DBComboBox1.Left := Rect.Left+1;
//    DBComboBox1.Top := Rect.Top;
//    DBComboBox1.Width := Rect.Right - Rect.Left+3;
//    DBComboBox1.Height := Rect.Bottom - Rect.Top;
//{    self.get_value(dm.ado89parameter_ptr.Value);
//    if dbcombobox1.Items.Count > 0 then
//     DBComboBox1.Visible := True
//    else
//     DBComboBox1.Visible := false;
// }
//   end;
// end;
//
//with TMyDBGrid(Sender) do
// begin
//  if DataLink.ActiveRecord=Row-1 then
//   begin
//    Canvas.Font.Color:=clWhite;
//    Canvas.Brush.Color:=$00800040;
//   end
//  else
//   begin
//    Canvas.Brush.Color:=Color;
//    Canvas.Font.Color:=Font.Color;
//   end;
//  DefaultDrawColumnCell(Rect,DataCol,Column,State);
// end;

end;

procedure TAddEditForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (key=40) and             //如果是下箭头如果是最后一条记录
//    (ADOQ0089.RecNo = ADOQ0089.RecordCount) then abort;
//
// if key=45 then abort; //insert键
//
// if (key=46) and (ssCtrl in shift) then abort;//删除记录
//
// if (key=112) and                //F1键出现下拉
//    (dbcombobox1.Visible) and
//    (dbcombobox1.Enabled) then
//  begin
//   dbcombobox1.SetFocus;
//   dbcombobox1.DroppedDown:=true;
//  end;

end;

procedure TAddEditForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if self.ADOQ0089MyDATATYPE.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;

//if (key <> chr(9)) then
// begin
//  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
//     (dbcombobox1.Items.Count > 0) and
//     (dbcombobox1.Enabled)  then
//   begin
//    DBComboBox1.SetFocus;
//    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
//   end;
// end;
end;

procedure TAddEditForm1.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TAddEditForm1.PageControl1Change(Sender: TObject);
begin
  BtnCopy.Visible:=(MyEditMode<>2) and (PageControl1.ActivePageIndex=1) and DBGrid1.DataSource.DataSet.Active and not DBGrid1.DataSource.DataSet.IsEmpty;
  Label36.Visible:=BtnCopy.Visible;
  Edit20.Visible:=BtnCopy.Visible;
end;

procedure TAddEditForm1.BtnCopyClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if Edit20.Text<>'' then s:='Data0025.MANU_PART_NUMBER like ''%'+Edit20.Text+'%'' and ';
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/100,MANU_PART_DESC/客户型号/100,PROD_CODE/产品类别代码/200,PRODUCT_NAME/产品类别名称/200';
    InputVar.Sqlstr := 'SELECT dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PROD_CODE,'+
                       'dbo.Data0008.PRODUCT_NAME FROM dbo.Data0025 INNER JOIN '+
                       'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY '+
                       'where '+s+'Data0025.PARENT_PTR is null and Data0025.MANU_PART_NUMBER<>'''+Edit2.Text+''' order by dbo.Data0025.MANU_PART_NUMBER';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select parameter_ptr,tvalue from data0089 '+
                       'where cust_part_ptr='+frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
      DM.tmp.Open;
      while not DM.tmp.Eof do
      begin
        if ADOQ0089.Locate('parameter_ptr',DM.tmp.Fields[0].asinteger,[]) then
        begin
          ADOQ0089.Edit;
          ADOQ0089.FieldByName('tvalue').Value:=DM.tmp.Fields[1].Value;
          ADOQ0089.Post;
        end;
        DM.tmp.Next;
      end;
      DM.tmp.Close;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TAddEditForm1.FormDestroy(Sender: TObject);
begin
dm.ADOQ02780002.Close;
end;

procedure TAddEditForm1.CopyStandar(Sender: TObject);
var i,j:word;
    parent,toprkey25:integer;
    sRev:string;
    QueryTmp1,QueryTmp2,QueryTmp3:TADOQuery;
    createtime2 :tdatetime;
begin
  QueryTmp1:=TADOQuery.Create(Self);
  QueryTmp1.Connection := DM.ADOConnection1;
  QueryTmp2:=TADOQuery.Create(Self);
  QueryTmp2.Connection := DM.ADOConnection1;
  QueryTmp3:=TADOQuery.Create(Self);
  QueryTmp3.Connection := DM.ADOConnection1;

  dm.ADOConnection1.BeginTrans;    //开始变更，复制数据
 //screen.Cursor:=crappstart;
  toprkey25:=0;
  try
           createtime2 := getsystem_date(dm.TemADOQuery1,0) ;
          for i:=0 to treeview1.Items.Count-1 do
          begin
               parent:=Pinteger(treeview1.Items[i].Data)^;
               with QueryTmp1 do
               begin
                    close;
                    sql.Text:='select * from data0025 where rkey='+ inttostr(parent);
                    open;
               end;

               dm.AQY0025.Close;
               dm.AQY0025.Parameters[0].Value:=null;
               dm.AQY0025.Open;
               dm.AQY0025.append;
               {for j:=4 to 61 do
               dm.AQY0025.Fields[j].Value:=QueryTmp1.FieldValues[dm.AQY0025.Fields[j].FieldName];
               dm.AQY0025CREATED_BY_EMPL_PTR.Value:= strtoint(user_ptr);
               dm.AQY0025CUSTPART_ENT_DATE.Value:= getsystem_date(QueryTmp2,1);
               dm.AQY0025LAST_MODIFIED_DATE.Value:= getsystem_date(QueryTmp2,0);
               dm.AQY0025LAST_MODIFIED_BY_PTR.Value:= strtoint(user_ptr);
               dm.AQY0025TSTATUS.Value:=6;     //未提交

               dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
               dm.AQY0025CHECK_DATE.AsVariant:=null;
               dm.AQY0025AUDITED_BY_PTR.AsVariant:=null;
               dm.AQY0025AUDITED_DATE.AsVariant:=null;
               dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';       //允许编辑
               dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;       //可以销售
               dm.AQY0025ONHOLD_RELEASE_FLAG.Value:=1;     //工单发出暂缓
               dm.AQY0025ONHOLD_PLANNING_FLAG.Value:=1;    //投产暂缓 }

               dm.AQY0025ttype.value := RadioGroup1.ItemIndex ;
               dm.AQY0025CUSTOMER_PTR.Value := vrkey0010;
               dm.AQY0025PROD_CODE_PTR.Value := vrkey0008;
               dm.AQY0025prod_route_ptr.Value:= self.vrkey0015;
               if vrkey0504 <> -9999 then
                dm.AQY0025ENG_ROUTE_PTR.value := vrkey0504
               else
                dm.AQY0025ENG_ROUTE_PTR.AsVariant := null ;

               dm.AQY0025CUSTPART_ENT_DATE.Value :=createtime2;

               dm.AQY0025CREATED_BY_EMPL_PTR.Value := self.Myuser_ptrCaption ;

               dm.AQY0025MANU_PART_NUMBER.Value :=  trim(edit2.Text);
               dm.AQY0025MANU_PART_DESC.Value := edit3.Text;
               dm.AQY0025SAMPLE_NR.Value := edit6.Text;

               dm.AQY0025SO_UNIT.AsString := RadioGroup2.Items[RadioGroup2.ItemIndex];

               dm.AQY0025LAYERS.AsString := edit12.Text;
               dm.AQY0025set_qty.AsString := edit10.Text;
               dm.AQY0025set_lngth.AsString := edit7.Text;
               dm.AQY0025set_width.AsString := edit14.Text;

               dm.AQY0025spell_qty.Value:=dm.AQY0025set_qty.Value;
               dm.AQY0025spell_lngth.Value:=dm.AQY0025set_lngth.Value;
               dm.AQY0025spell_width.Value:=dm.AQY0025set_width.Value;

               dm.AQY0025pcs_lngth.AsString := edit15.Text;
               dm.AQY0025pcs_width.AsString := edit16.Text;

               dm.AQY0025pcs_sq.Value := strtofloat(TRIM(EDIT15.TEXT))*strtofloat(TRIM(EDIT16.TEXT))/changeUnit2;
               dm.AQY0025unit_sq.Value  := strtofloat(TRIM(EDIT7.TEXT))*strtofloat(TRIM(EDIT14.TEXT))/strtoint(edit10.Text)/changeUnit2;

               dm.AQY0025ANALYSIS_CODE_5.Value := TRIM(EDIT15.TEXT)+'mm * '+TRIM(EDIT16.TEXT)+'mm';
               if ((TRIM(EDIT7.TEXT)<>'') or (TRIM(EDIT7.TEXT)<>'0')) and ((TRIM(EDIT14.TEXT)<>'') or (TRIM(EDIT14.TEXT)<>'0')) then
                   dm.AQY0025ANALYSIS_CODE_1.Value := TRIM(EDIT7.TEXT)+'mm * '+TRIM(EDIT14.TEXT)+'mm';

               dm.AQY0025ANALYSIS_CODE_2.AsString := edit8.Text;

               IF RadioButton1.Checked then
                dm.AQY0025green_flag.AsString := 'Y'
               ELSE
                dm.AQY0025green_flag.AsString := 'N' ;

               IF  current_ck.Checked then
                dm.AQY0025current_rev.Value := 'Y'
               ELSE
                dm.AQY0025current_rev.Value := 'N' ;

               IF  CheckBox2.Checked then         //无铅要求
                dm.AQY0025nopb_flag.Value := 1
               ELSE
                dm.AQY0025nopb_flag.Value := 0;

               if CheckBox3.Checked then          //REACH要求
                dm.AQY0025REACH.Value:=true
               else
                dm.AQY0025REACH.Value:=false;

               dm.AQY0025memo_text.AsString := Memo1.Text ;

               dm.AQY0025remark.AsString := Memo4.Text;
               dm.AQY0025eng_note.AsString := Memo5.Text;

               dm.AQY0025TSTATUS.Value := 6 ;

               dm.AQY0025OPT_LOT_SIZE.asstring := edit4.Text ;
               dm.AQY0025EST_SCRAP.AsString := edit9.Text  ;
               dm.AQY0025SHELF_LIFE.AsString := edit11.Text   ;
               dm.AQY0025MFG_LEAD_TIME.AsString := edit13.Text   ;
               dm.AQY0025REVIEW_DAYS.Value :=StrToInt(Edit19.Text);
               dm.AQY0025ANALYSIS_CODE_3.AsString := edit17.Text ;//大料规格
               dm.AQY0025MANU_PART_NUMBER.Value:=treeview2.Items[i].Text;


               if i > 0 then
                dm.AQY0025PARENT_PTR.Value:=self.getparent_ptr(treeview2.Items[i])
               else
               begin
                dm.AQY0025PARENT_PTR.AsVariant:=null;
                dm.AQY0025PROD_CODE_PTR.Value:=rkey08;
                dm.AQY0025ANCESTOR_PTR.Value:=0; //ecn升级新增
               end;

               if RadioGroup1.ItemIndex <> -1 then
                dm.AQY0025ttype.Value:=RadioGroup1.ItemIndex    //量产
               else
                dm.AQY0025ttype.Value:=RadioGroup1.ItemIndex;   //样版
               dm.AQY0025.Post;  //以上复制厂编基本信息25表    

               if i=0 then  toprkey25:=dm.AQY0025RKEY.Value;
               Pinteger(treeview2.Items[i].Data)^:=dm.AQY0025RKEY.Value;

            {   with dm.ADOQuery1 do       //拼版结构
               begin
                close;
                sql.Text:='select * from data0502 where source_ptr='+ inttostr(parent);
                open;
               end;
               if not dm.ADOQuery1.IsEmpty then
               begin
                dm.ads502.Close;
                dm.ads502.Parameters[0].Value:=null;
                dm.ads502.Open;
                dm.ads502.Append;
                for j:=1 to 20 do
                 dm.ads502.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.ads502.Fields[j].FieldName];
                dm.ads502source_ptr.Value:= dm.AQY0025RKEY.Value;
                dm.ads502.Post;
               end;  }
               //----//以下复制bom参数和工序流程
               with QueryTmp2 do      //打开BOM制程参数
               begin
                close;
                sql.Text:=
                 'SELECT Data0497.PARAMETER_PTR, Data0497.PARAMETER_VALUE,'+#13+
                 'Data0497.SOURCE_PTR, Data0497.ROUTE_STEP_PTR,Data0497.SEQ_NO'+#13+
                 'FROM dbo.Data0038 INNER JOIN'+#13+
                 'dbo.Data0497 ON dbo.Data0038.RKEY = dbo.Data0497.ROUTE_STEP_PTR'+#13+
                 'where data0038.source_ptr='+inttostr(parent)+#13+
                 'order by Data0497.ROUTE_STEP_PTR';
                open;
               end;

               with QueryTmp1 do       //打开工艺流程
               begin
                close;
                sql.Text:='SELECT rkey,SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,'+#13+
                          'tooling_rev,OUTP_SPFC,tool_old_rev FROM Data0038'+#13+
                  'where source_ptr='+inttostr(parent)+#13+
                  'order by step_number';
                open;
                if not isempty then
                begin
                 dm.ADS38.Close;
                 dm.ADS38.Parameters[0].Value:=null;
                 dm.ADS38.Open;
                 if not QueryTmp2.IsEmpty then dm.ads497.Open;

                 while not eof do
                 begin
                  dm.ADS38.Append;
                  for j:=2 to 7 do
                   dm.ADS38.Fields[j].Value := FieldValues[dm.ADS38.Fields[j].FieldName];
                  dm.ADS38SOURCE_PTR.Value := dm.AQY0025RKEY.Value;
                  dm.ADS38tool_old_rev.Value:=dm.ADS38tooling_rev.Value;
                  if trim(dm.ADS38tooling_rev.Value)<>'' then
                    dm.ADS38tooling_rev.Value:=sRev;
                  dm.ADS38.post;

                  QueryTmp2.Filter:='ROUTE_STEP_PTR='+fieldbyname('rkey').AsString;
                  while not QueryTmp2.Eof do
                  begin
                   dm.ads497.Append;
                   for j:=0 to 4 do
                    dm.ads497.Fields[j].Value :=dm.ADOQuery2.FieldValues[dm.ads497.Fields[j].FieldName];
                   dm.ads497ROUTE_STEP_PTR.Value:=dm.ads38rkey.value;
                   dm.ads497.Post;
                   QueryTmp2.Next;
                  end;
                  next;
                 end;
                 QueryTmp2.Filter:='';
                end;
               end;    //----//以上复制bom参数和工序流程

              { if (radiobutton4.Checked) and (find_ecn_qa()) then
               with QueryTmp1 do  //样板转批量将样品品质跟踪表复制到工序制程参数
                begin
                  Close;
                  SQL.Text := 'update data0038'+#13+
                   'set DEF_ROUT_INST=isnull(DEF_ROUT_INST,'''')+isnull(DATA0031.technology_diff,'''')'+#13+
                   'FROM         dbo.DATA0031 INNER JOIN  '+#13+
                   'dbo.Data0038 ON dbo.DATA0031.STEP_NUMBER = dbo.Data0038.STEP_NUMBER'+#13+
                   'AND dbo.DATA0031.DEPT_PTR = dbo.Data0038.DEPT_PTR'+#13+
                   'WHERE     (dbo.DATA0031.SOURCE_PTR = '+inttostr(parent)+') AND'+#13+
                   '(dbo.Data0038.SOURCE_PTR = '+dm.AQY0025RKEY.AsString+')';
                  ExecSQL;
                end;  }

               with QueryTmp1 do //制程参数
               begin
                close;
                sql.Text:='SELECT Data0494.PARAMETER_PTR, Data0494.PARAMETER_VALUE,'+#13+
                 'Data0494.custpart_ptr,Data0494.step_number,Data0494.seq_no,Data0494.Doc_Flag,'+#13+
                 'Data0494.after_flag, Data0494.flow_spfc_flag,data0278.status4'+#13+
                 'FROM Data0494 inner join data0278'+#13+
                 'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
                 'where Data0494.custpart_ptr = '+inttostr(parent)+#13+
                 'order by Data0494.step_number,Data0494.seq_no';
                open;
                if not isempty then
                begin
                 dm.ads494.Close;
                 dm.ads494.Parameters[0].Value:=null;
                 dm.ads494.Open;
                 while not eof do
                 begin
                  dm.ads494.Append;
                  for j:=0 to 7 do
                   dm.ads494.Fields[j].Value:=FieldValues[dm.ads494.Fields[j].FieldName];
                  dm.ads494custpart_ptr.Value:= dm.AQY0025RKEY.Value;
                  if fieldbyname('status4').AsInteger=1 then
                   dm.ads494PARAMETER_VALUE.Value:='';
                  dm.ads494.post;
                  next;
                 end;
                end;
               end;

               with QueryTmp1 do         //全局参数加流程判断参数
               begin
                close;
                sql.Text:='select data0279.PARAMETER_PTR, data0279.PARAMETER_VALUE ,'+#13+
                 'data0279.IES_PROD,data0279.IES_CRP,data0278.status4'+#13+
                 'from data0279 inner join data0278'+#13+
                 'on data0279.PARAMETER_PTR=data0278.rkey'+#13+
                 'where data0279.source_ptr='+inttostr(parent)+#13+
                 'order by data0279.IES_CRP';
                open;
                if not isempty then
                begin
                 dm.ads279.close;
                 dm.ads279.Parameters[0].Value:=null;
                 dm.ads279.Open;
                 while not eof do
                 begin
                  dm.ads279.Append;
                  for j:=1 to 4 do
                   dm.ads279.Fields[j].Value:=FieldValues[dm.ads279.Fields[j].FieldName];
                  dm.ads279source_PTR.Value:= dm.AQY0025RKEY.Value;
                  if fieldbyname('status4').AsInteger=1 then
                   dm.ads279PARAMETER_VALUE.Value:='';
                  dm.ads279.post;
                  next;
                 end;
                end;
               end;

               with QueryTmp1 do      //89评审参数
               begin
                close;
                sql.Text:='SELECT cust_part_ptr,parameter_ptr,tvalue'+#13+
                 'FROM dbo.Data0089'+#13+
                 'where cust_part_ptr='+inttostr(parent);
                open;
                if not isempty then
                begin
                 with QueryTmp2 do
                 begin
                  close;
                  sql.Text:='SELECT cust_part_ptr,parameter_ptr,tvalue'+#13+
                   'FROM dbo.Data0089'+#13+
                   'where cust_part_ptr is null';
                  open;
                 end;
                 while not eof do
                 begin
                  QueryTmp2.Append;
                  for j:=1 to 2 do
                   QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                  QueryTmp2.FieldValues['cust_part_ptr']:= dm.AQY0025RKEY.Value;
                  QueryTmp2.Post;
                  next;
                 end;
                end;
               end;

               with QueryTmp1 do   //29 钻咀表
               begin
                close;
                sql.Text:=
                 'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                 'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                 'FROM dbo.Data0029'+#13+
                 'where source_ptr='+inttostr(parent);
                open;
                if not isempty then
                begin
                 with QueryTmp2 do
                 begin
                  close;
                  sql.Text:=
                  'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                  'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                  'FROM dbo.Data0029'+#13+
                  'where source_ptr is null';
                  open;
                 end;

                 while not eof do
                 begin
                  QueryTmp2.Append;
                   for j:=1 to 12 do
                   QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                  QueryTmp2.FieldValues['SOURCE_PTR']:= dm.AQY0025RKEY.Value;
                  QueryTmp2.Post;
                  next;
                 end;
                end;
               end;

               if i=0 then
                with QueryTmp1 do   //复制35 ecn履历表
                begin
                 close;
                 sql.Text:=
                  'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,create_employee,'+#13+
                  'engineer,ecn_no,enter_date '+#13+
                  'FROM Data0035'+#13+
                  'where part_ptr='+inttostr(parent);
                 open;
                 if not isempty then
                 begin
                  with QueryTmp2 do
                  begin
                   close;
                   sql.Text:=
                    'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,create_employee,'+#13+
                    'engineer,ecn_no,enter_date '+#13+
                    'FROM Data0035'+#13+
                    'where part_ptr is null';
                   open;
                  end;

                  while not eof do
                  begin
                   QueryTmp2.Append;
                   for j:=1 to 9 do
                    QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                   QueryTmp2.FieldValues['part_ptr']:= dm.AQY0025RKEY.Value;
                   QueryTmp2.Post;
                   next;
                  end;
                 end;
                end;

          end;       //结束循环新增

  {dm.adsa273.Close;
  dm.adsa273.Parameters[0].Value:=null;
  dm.adsa273.Open;
  dm.adsa273.Append;
  dm.adsa273CUSTOMER_PTR.Value:=rkey10;
  dm.adsa273COPYFROMCUST_PTR.Value:=rkey25;
  dm.adsa273CUSTOMER_PART_PTR.Value:=toprkey25;
  dm.adsa273ENTERED_BY.Value:= strtoint(user_ptr);
  dm.adsa273ENTERED_DATE.Value:=getsystem_date(QueryTmp2,1);
  dm.adsa273last_modi_by_ptr.Value:= dm.adsa273ENTERED_BY.Value;
  dm.adsa273last_modi_date.Value:=getsystem_date(QueryTmp2,0);
  if radiobutton1.Checked then
   dm.adsa273Tooling_close.Value:=1
  else if radiobutton2.Checked then
   dm.adsa273Tooling_close.Value:=2
  else if radiobutton3.Checked then
   dm.adsa273Tooling_close.Value:=3
  else dm.adsa273Tooling_close.Value:=4;
  dm.adsa273text.Value:=memo1.Text;
  dm.adsa273ECNSTART.Value:=radiogroup2.ItemIndex;
  dm.adsa273ECN_NO.Value:=edit1.Text;
  dm.adsa273STATUS.Value:=0;
  dm.adsa273SOURCE.Value:=radiogroup1.ItemIndex+1;
  dm.adsa273del.Value:=sales_flag;
  dm.adsa273.Post;  }

  {dm.ADs04.Close;
  dm.ADs04.Open;
  if dm.ADs04SEED_FLAG.Value<>1 then
   self.update_04(trim(edit1.Text));

  //if checkbox1.Checked then update_08;     //是否更新初始值

  {if dm.adsa273del.Value=0 then           //是否将旧版本暂缓
   UPDATEDATA0025(radiogroup2.ItemIndex,dm.adsa273COPYFROMCUST_PTR.Value); }

   update_08;
  UPDATEDATA0025(dm.AQY0025rkey.value);
  {if dm.adsa273Tooling_close.Value=4 then
   self.append_log119(dm.adsa273CUSTOMER_PART_PTR.Value);     }

  dm.ADOConnection1.CommitTrans;
  dm.AQY0025.Close;
 // dm.ads502.Close;
  dm.ADS38.Close;
  dm.ads494.Close;
  dm.ads497.Close;
  dm.ads279.Close;
  QueryTmp1.Free;
  QueryTmp2.Free;
   // messagedlg('ECN数据复制成功!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
 except
    on E: Exception do
    begin
         dm.ADOConnection1.RollbackTrans;
         screen.Cursor:=crdefault;
         messagedlg(E.Message,mterror,[mbcancel],0);
    end;
 end; //end try      
 
end;

procedure TAddEditForm1.append_log119(rkey: integer);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT CUST_PART_PTR, ENT_DATE from data0119'+#13+
            'where CUST_PART_PTR is null';
  open;
  append;
  fieldvalues['cust_part_ptr']:=rkey;
  fieldvalues['ENT_DATE']:= getsystem_date(dm.adoquery2,0);
  post;
 end;
end;

procedure TAddEditForm1.get_treedate(rkey25: integer;treeview:Ttreeview);
var node:ttreenode;   //treeview控件的节点变量
    rkey0025:^integer;
    QueryTmp1,QueryTmp2,QueryTmp3:TADOQuery;
begin
  QueryTmp1:=TADOQuery.Create(Self);
  QueryTmp1.Connection := DM.ADOConnection1;
  QueryTmp2:=TADOQuery.Create(Self);
  QueryTmp2.Connection := DM.ADOConnection1;
  QueryTmp3:=TADOQuery.Create(Self);
  QueryTmp3.Connection := DM.ADOConnection1;

with QueryTmp1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
              inttostr(rkey25);
  open;
  new(rkey0025);
  rkey0025^:=fieldvalues['rkey'];
  node:=treeview.Items.AddObject
  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
  node.ImageIndex:=0;  //为第一层节点定义图画
 end;

with QueryTmp1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(rkey25);
  open;
  while not QueryTmp1.Eof do
  begin
   new(rkey0025);
   rkey0025^:= QueryTmp1.fieldvalues['rkey'];
   node:=treeview.Items.AddChildObject
      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
   node.ImageIndex := 1;
   with QueryTmp2 do
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              QueryTmp1.fieldbyname('rkey').AsString;
     open;
     while not QueryTmp2.Eof do
     begin
      new(rkey0025);
      rkey0025^:= QueryTmp2.fieldvalues['rkey'];
      node:=treeview.Items.AddChildObject
       (node, QueryTmp2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
      node.ImageIndex := 2;
       with QueryTmp3 do
        begin
         close;
         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
                  QueryTmp2.fieldbyname('rkey').AsString;
         open;
         while not QueryTmp3.Eof do
         begin
          new(rkey0025);
          rkey0025^:= QueryTmp3.fieldvalues['rkey'];
          node:=treeview.Items.AddChildObject
           (node, QueryTmp3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
          node.ImageIndex := 3;
          node:=node.Parent;
          QueryTmp3.Next;
         end;
        end;
      node:=node.Parent;
      QueryTmp2.Next;
     end;
    end;
   node:=node.Parent; //节点指向其父节点值
   QueryTmp1.Next;
  end;
 end;
 treeview.FullExpand; //全部展开
 QueryTmp1.Free;
 QueryTmp2.Free;
 QueryTmp3.Free;
end;

procedure TAddEditForm1.UPDATEDATA0025(RKEY:integer);
var
      QueryTmp1:TADOQuery;
BEGIN
      QueryTmp1:=TADOQuery.Create(Self);
      QueryTmp1.Connection := DM.ADOConnection1;
      with QueryTmp1 do     //更新顶层
       begin
        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+
                 'FROM dbo.Data0025'+#13+
        'where Data0025.RKEY='+inttostr(rkey);
        ExecSQL;

                //更新第二层

        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+
                 'FROM Data0025 INNER JOIN'+#13+
        'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
        'where Data0025_1.RKEY='+inttostr(rkey);
        ExecSQL;


           //更新第三层

        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+  //暂缓下单
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+   //暂缓发放工单
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+  //暂缓投产
          'FROM data0025 INNER JOIN  '+#13+
          'Data0025 Data0025_1 ON'+#13+
          'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
          'Data0025 Data0025_2 ON '+#13+
          'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
         'where Data0025_2.RKEY = '+inttostr(rkey);
        ExecSQL;


           //更新第四层

        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+  //暂缓下单
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+   //暂缓发放工单
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+  //暂缓投产
          'FROM data0025 INNER JOIN  '+#13+
          'Data0025 Data0025_1 ON'+#13+
          'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
          'Data0025 Data0025_2 ON '+#13+
          'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
          'Data0025 Data0025_3 ON '+#13+
          'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
         'where Data0025_3.RKEY = '+inttostr(rkey);
        ExecSQL;
      end;
    QueryTmp1.Free;

end;

procedure TAddEditForm1.update_08();
var
 i,v_length:integer;
 v_last,new_seed,v_seed:string;
    QueryTmp1:TADOQuery;
begin
  QueryTmp1:=TADOQuery.Create(Self);
  QueryTmp1.Connection := DM.ADOConnection1;

 with QueryTmp1 do
  begin
   close;
   sql.Text:='select data0081.sufchar from data0081'+#13+
             'inner join data0008 on data0081.rkey=data0008.layer_pre'+#13+
             'where data0008.rkey='+inttostr(rkey08);
   open;
   v_seed := trim(fieldbyname('sufchar').AsString);
   v_length := length(v_seed);
  end;

 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    QueryTmp1.Edit;                   //使前缀不变后缀加1
    QueryTmp1.FieldValues['sufchar']:= new_seed;
    QueryTmp1.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     QueryTmp1.Edit;                   //使前缀不变后缀加1
     QueryTmp1.FieldValues['sufchar']:= new_seed;
     QueryTmp1.Post;
    end;
end;

procedure TAddEditForm1.btnRFQClick(Sender: TObject);
var
  PARAM_DESC, PARAM_Value: string;
begin
  try
    Application.CreateForm(TfrmFindRFQ, frmFindRFQ);
    with dm.aqFindRFQ do
    begin
      Close;
      Parameters.Items[0].Value:= Edit1.Text;
      Parameters.Items[1].Value:= Edit1.Text;
      Open;
    end;
    if frmFindRFQ.ShowModal = mrok then
    begin
      Edit22.Text:= dm.aqFindRFQRFQNo.Value;  //RFQ编号
      Edit3.Text:= dm.aqFindRFQFileName.Value;//客户型号(文件名)
      Edit8.Text:= dm.aqFindRFQPartsId.Value; //客户物料号(零件号)
      with dm.aqRFQParam do
      begin
        Close;
        Parameters.ParamByName('RKEY165').Value:= dm.aqFindRFQ.FieldByName('RKEY').Value;
        Open;
        First;
        while not Eof do
        begin
          PARAM_DESC:= Trim(dm.aqRFQParam.FieldByName('PARAMETER_DESC').AsString);
          PARAM_Value:= dm.aqRFQParam.FieldByName('Param_Value').AsString;
          if PARAM_DESC = '板料类型' then Edit17.Text:= PARAM_Value;            //大料规格
          if PARAM_DESC = '外形加工方式' then Edit6.Text:= PARAM_Value;         //测试成型备注
          if VMyEditMode <> 3 then   //VMyEditMode=3编辑客户型号
          begin
            if PARAM_DESC = 'PCS/SET' then Edit10.Text:= PARAM_Value;             //交货板单元数
            if PARAM_DESC = '备注信息' then Memo4.Text:= PARAM_Value;             //加工指示
            if PARAM_DESC = '层数' then Edit12.Text:= PARAM_Value;                //层数
            if PARAM_DESC = 'PCS长度' then Edit15.Text:= PARAM_Value;
            if PARAM_DESC = 'PCS宽度' then Edit16.Text:= PARAM_Value;
            if PARAM_DESC = 'SET长度' then Edit7.Text:= PARAM_Value;
            if PARAM_DESC = 'SET宽度' then Edit14.Text:= PARAM_Value;
          end;
          Next;
        end;
      end;
    end;
  finally
    frmFindRFQ.Free;    
  end;
end;

procedure TAddEditForm1.Edit22Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'CUST_CODE/客户代码/100,ABBR_NAME/客户简称/100,CUSTOMER_NAME/客户名称/200';
    InputVar.Sqlstr := 'select RKEY,CUST_CODE,ABBR_NAME,CUSTOMER_NAME,ANALYSIS_CODE3 from data0010 '+
                       'order by CUST_CODE';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
      Edit23.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TAddEditForm1.Edit23Change(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit23Exit(Sender: TObject);
begin
  Abbr_NameCheck;
end;

function TAddEditForm1.Abbr_NameCheck: Boolean;
begin
  Result := True;
  if Trim(Edit23.Text) <> '' then
  begin
    DM.qry1.close;
    DM.qry1.SQL.Text  := 'select 1 from data0010 where abbr_name = ' + quotedstr(Edit23.Text);
    DM.qry1.Open;
    if DM.qry1.IsEmpty then
    begin
      ShowMessage('无效的关联原客户');
      Result := False;
    end;
  end;
end;

procedure TAddEditForm1.dbrgrppricing_principleChange(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.rg1Click(Sender: TObject);
begin
  if (VMyEditMode <> 2) and vs2 then
      BitBtn1.Enabled  := true ;
end;

procedure TAddEditForm1.Edit15Exit(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text) = '' then (Sender as TEdit).Text := '0';
end;

procedure TAddEditForm1.btn3Click(Sender: TObject);
var
  LIni: TIniFile;
  LIniFileName: string;
begin
  LIniFileName := ExtractFilePath(ParamStr(0)) + 'pinban.ini';
  LIni := TIniFile.Create(LIniFileName);
  try
    LIni.WriteString('CustFileFTP','IP',edtftpip.Text);
    LIni.WriteString('CustFileFTP','UserName',edtftpusername.Text);
    LIni.WriteString('CustFileFTP','PassWord',edtftppassword.Text);
    LIni.WriteString('CustFileFTP','Dir',edtftpdir.Text);
  finally
    LIni.Free;
  end;
  pnl1.Visible := False;
end;

procedure TAddEditForm1.btn2Click(Sender: TObject);
var
  LIni: TIniFile;
  LIniFileName: string;
begin
  pnl1.Visible := True;
  pnl1.BringToFront;
  LIniFileName := ExtractFilePath(ParamStr(0)) + 'pinban.ini';
  LIni := TIniFile.Create(LIniFileName);
  try
    edtftpip.Text := LIni.ReadString('CustFileFTP','IP',edtftpip.Text);
    edtftpusername.Text := LIni.ReadString('CustFileFTP','UserName',edtftpusername.Text);
    edtftppassword.Text := LIni.ReadString('CustFileFTP','PassWord',edtftppassword.Text);
    edtftpdir.Text := LIni.ReadString('CustFileFTP','Dir',edtftpdir.Text);
  finally
    LIni.Free;
  end;
end;

procedure TAddEditForm1.btn1Click(Sender: TObject);
var
  LIni: TIniFile;
  LIniFileName: string;
  LDir: WideString;
begin
  if Trim(edit2.Text) = '' then
  begin
    ShowMessage('请先确定本场编号');
    Exit;
  end;
  if idftp1.Connected then IdFTP1.Disconnect;
  LIniFileName := ExtractFilePath(ParamStr(0)) + 'pinban.ini';
  LIni := TIniFile.Create(LIniFileName);
  try
    IdFTP1.Host := LIni.ReadString('CustFileFTP','IP',edtftpip.Text);
    IdFTP1.Username := LIni.ReadString('CustFileFTP','UserName',edtftpusername.Text);
    IdFTP1.Password := LIni.ReadString('CustFileFTP','PassWord',edtftppassword.Text);
    LDir := LIni.ReadString('CustFileFTP','Dir',edtftpdir.Text);

    try
      IdFTP1.Connect();
      if IdFTP1.Connected then
      begin
        if Trim(LDir) <> '' then
        begin
          try
            if LDir[Length(LDir)] <> '\' then LDir := LDir + '\';
            IdFTP1.ChangeDir(LDir);
          except
            ShowMessage('文件夹路径不正确');
            Exit;
          end;
        end;
        if dlgOpen1.Execute then
        begin
          if dbtxtCustFileName.Caption <> '' then
          begin
            if MessageBoxA(Handle,'是否覆盖原有资料？','提示',MB_YESNO) <> id_yes then
            begin
              Exit;
            end;
          end;
          IdFTP1.Put(dlgOpen1.FileName,edit2.Text + ExtractFileExt(dlgOpen1.FileName));
          DM.ADOQuery2.Edit;
          DM.ADOQuery2.FieldByName('CustFileName').AsString := LDir + edit2.Text + ExtractFileExt(dlgOpen1.FileName);
          DM.ADOQuery2.Post;
          BitBtn1.Enabled := True;      
        end;
      end;
    except
      ShowMessage('FTP链接失败,上传失败');
      Exit;
    end;
  finally
    if IdFTP1.Connected then IdFTP1.Disconnect;
    LIni.Free;
  end;
end;

end.
