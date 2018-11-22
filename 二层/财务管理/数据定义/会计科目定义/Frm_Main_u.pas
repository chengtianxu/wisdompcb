unit Frm_Main_u;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, DB, DBClient, Grids, DBGrids,DBCtrls,{PubFunc,}DateUtils,
  StdCtrls, Buttons, ImgList, ADODB, DBActns, ActnList, ExtCtrls,ComObj, Excel2000;

type
  TcdsState = (ad,ed,de,bo,Au);
  TFrm_Main = class(TForm)
    ToolBar1: TToolBar;
    BtAdd: TToolButton;
    BtEdit: TToolButton;
    BtDel: TToolButton;
    BtCancel: TToolButton;
    BtSave: TToolButton;
    ToolButton11: TToolButton;
    BtPrint: TToolButton;
    BtClose: TToolButton;
    ToolButton1: TToolButton;
    DS1: TDataSource;
    ToolButton2: TToolButton;
    BtImageList: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    ActPrnt: TAction;
    ActFmt: TAction;
    ActQry: TAction;
    ActHlp: TAction;
    ActClose: TAction;
    ActFst: TAction;
    ActPr: TAction;
    ActNxt: TAction;
    ActLst: TAction;
    ActAdd: TAction;
    ActEdt: TAction;
    ActDel: TAction;
    ActSve: TAction;
    ActCac: TAction;
    Panel4: TPanel;
    status1: TPanel;
    status2: TPanel;
    BTXls: TToolButton;
    ActPgUp: TAction;
    ActPgDown: TAction;
    ActRegister: TAction;
    SaveDialog1: TSaveDialog;
    ActLocate: TAction;
    ActCopy: TAction;
    Panel1: TPanel;
    ImageList1: TImageList;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Edit5: TEdit;
    BitBtn4: TBitBtn;
    CheckBox2: TCheckBox;
    Panel3: TPanel;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TV0: TTreeView;
    TV1: TTreeView;
    TV2: TTreeView;
    TV3: TTreeView;
    TV4: TTreeView;
    ImageList2: TImageList;
    GroupBox4: TGroupBox;
    BtQry: TButton;
    Edit6: TEdit;
    CBValid: TCheckBox;
    procedure BtAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TV0Click(Sender: TObject);
    procedure TV0GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TV0GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure TV0Change(Sender: TObject; Node: TTreeNode);
  private
    A,E,D,P:boolean;
    FL1,FL2,FL3,FL4,FL5,FL6:integer;
    cdsState:TcdsState;
    Dt:TADOQuery;
    TV:TTreeView;
    Fnode:TTreeNode;
    iAuto_trans_ptr:integer;
    Fis:boolean;
    FYEAR:string;
    curr_key:array of integer;
    procedure init;
    procedure crtTree(Tp: integer);
    procedure getRtsAll;

    procedure BtnRts;
    procedure EdtEn;
    procedure svValid;
    procedure savValue;
    function vld:boolean;
    procedure ToXLS;
  public

  end;

var
  Frm_Main: TFrm_Main;

implementation
 uses DM_u,Frm_tree_u,Frm_hint_u,common;

{$R *.dfm}

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOCon) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.Caption:= application.Title;


//  vprev:='4';
//  dm.ADOCon.Open;

  init;
end;

procedure TFrm_Main.getRtsAll;
begin
 A:=(strtoint(vprev)=2) or (strtoint(vprev)=4);
 E:=A;
 D:=(strtoint(vprev)=4);

//A:=true;
//E:=true;
//d:=true;
end;

procedure TFrm_Main.BtnRts;
begin
  BtAdd.Enabled:=A  and (cdsState=bo) and (Fnode.Level<6);
  ActAdd.Enabled:=BtAdd.Enabled;

  BtEdit.Enabled:=E and (Dt.RecordCount>0) and (cdsState=bo) and (Fnode.Level<>0); 
  BtDel.Enabled:=D and  (Dt.RecordCount>0) and (cdsState=bo) and not Fnode.HasChildren and (Fnode.Level<>0);
  ActDel.Enabled:=BtDel.Enabled;
  BtCancel.Enabled:=(cdsState=ad) or (cdsState=ed);
  ActCac.Enabled:=BtCancel.Enabled;
  BtSave.Enabled:=BtCancel.Enabled;
  ActSve.Enabled:=BtSave.Enabled;
  BtPrint.Enabled:=P and (cdsState=bo);
  BtQry.Enabled:=cdsState=bo;
  ActEdt.Enabled:=BtEdit.Enabled;
  ActDel.Enabled:=BtDel.Enabled;
  BtXls.Enabled:=cdsState=bo;

  PageControl1.Enabled:=cdsState=bo;
  EdtEn;

end;

procedure TFrm_Main.BtAddClick(Sender: TObject);
var iRkey:^integer;
    skey:string;
    iDex:integer;
    iFiltered:Boolean;
begin
 if TToolButton(sender).Tag in [0,1] then
 begin
   if (PageControl1.ActivePageIndex in [1,2]) then    //负债及权益
    radiogroup1.itemindex:=1
   else if PageControl1.ActivePageIndex=3 then      //成本
     radiogroup1.itemindex:=0
   else if Fnode.Level>0  then
      begin if trim(Dt.fieldbyname('db_cr').asstring)='D' then
        radiogroup1.itemindex:=0
      else
        radiogroup1.itemindex:=1;
      end;
 end;

  case TToolButton(sender).Tag of
  0: begin
      cdsState:=ad;
      Dt.Append;
      status1.Caption:='当前状态  ： 新增';
     end;

  1: begin cdsState:=ed;Dt.Edit; status1.Caption:='当前状态  ： 编辑'; end;

  2: begin
       if vld then
       begin
         messagedlg('该科目已经发生业务不能删除！',mtinformation,[mbok],0);
         abort;
       end;
       if messagebox(Handle,'是否确定删除当前记录？','提示',mb_yesno+mb_iconquestion)=id_no then  abort;
       iDex:=Fnode.AbsoluteIndex;
       try
         Dt.Connection.BeginTrans;
         Dt.Delete;
         Fnode.Delete;
         Fnode:=TV.Items[iDex-1];
         if not Fnode.HasChildren then   //删除后 为明细科目
         begin
            DM.Tmp1.Close;
            DM.Tmp1.SQL.Text:='update Data0103 set has_child=0 where rkey='+inttostr(integer(Fnode.Data^));
            DM.Tmp1.ExecSQL;
         end;
         Dt.Connection.CommitTrans;
       except
         Dt.Connection.RollbackTrans;
         showmessage('删除数据失败...');
         abort;
       end;
       TV0Click(TV);
       cdsState:=bo;
       showmessage('删除数据成功...');
      end;
  3: begin
      cdsState:=bo;
      Dt.Cancel;
      TV0Click(TV);
      status1.Caption:='当前状态  ： 浏览';
     end;
  4: begin
       iFiltered:= Dt.Filtered;
       Dt.Filtered:= False;  //Filter导致当前Dt.FieldByName('rkey').AsString为空
       svValid;
       savValue;

       Dt.Connection.BeginTrans;
       try
         if Fis then     //新增下层，当层已发生业务
          begin
           Dt.Post;

           DM.Tmp1.Close;  //更新 Data0103 金额
           DM.Tmp1.SQL.text:='UPDATE t1 set '+
                             'TYR_OPEN=t2.TYR_OPEN,TYR_DEBIT=t2.TYR_DEBIT,TYR_CREDIT=t2.TYR_CREDIT,'+
                             'TYR_CLOSE=t2.TYR_CLOSE,TYR_PROFIT=t2.TYR_PROFIT,'+
                             'CURRENT_PERIOD_DEBIT=t2.CURRENT_PERIOD_DEBIT,'+
                             'CURRENT_PERIOD_CREDIT=t2.CURRENT_PERIOD_CREDIT,'+
                             'CURRENT_PERIOD_PROFIT=t2.CURRENT_PERIOD_PROFIT,'+
                             'TYR_OPEN_QTY=t2.TYR_OPEN_QTY,TYR_DEBIT_QTY=t2.TYR_DEBIT_QTY,'+
                             'TYR_CREDIT_QTY=t2.TYR_CREDIT_QTY,TYR_CLOSE_QTY=t2.TYR_CLOSE_QTY,'+
                             'CURRENT_PERIOD_DEBIT_QTY=t2.CURRENT_PERIOD_DEBIT_QTY,'+
                             'CURRENT_PERIOD_CREDIT_QTY=t2.CURRENT_PERIOD_CREDIT_QTY,'+
                             'TYR_OPEN_ORIG=t2.TYR_OPEN_ORIG,TYR_DEBIT_ORIG=t2.TYR_DEBIT_ORIG,'+
                             'TYR_CREDIT_ORIG=t2.TYR_CREDIT_ORIG,TYR_CLOSE_ORIG=t2.TYR_CLOSE_ORIG,'+
                             'TYR_PROFIT_ORIG=t2.TYR_PROFIT_ORIG,'+
                             'CURRENT_PERIOD_DEBIT_ORIG=t2.CURRENT_PERIOD_DEBIT_ORIG,'+
                             'CURRENT_PERIOD_CREDIT_ORIG=t2.CURRENT_PERIOD_CREDIT_ORIG,'+
                             'CURRENT_PERIOD_PROFIT_ORIG=t2.CURRENT_PERIOD_PROFIT_ORIG '+
                             'from data0103 t1, data0103 t2 '+
                             'where t1.PARENT_PTR = t2.RKEY '+
                             'and t1.RKEY = '+Dt.FieldByName('rkey').AsString;
           DM.Tmp1.ExecSQL;

           DM.Tmp1.Close;
           DM.Tmp1.SQL.text:='INSERT INTO Data0110'+
                            '(FYEAR, GL_ACCT_PTR, TYR_OPEN, TYR_DEBIT, TYR_CREDIT, TYR_CLOSE, TYR_PERIOD_1_DEBIT, TYR_PERIOD_1_CREDIT,'+
                              'TYR_PERIOD_1_CLOSE, TYR_PERIOD_2_DEBIT, TYR_PERIOD_2_CREDIT, TYR_PERIOD_2_CLOSE, TYR_PERIOD_3_DEBIT,'+
                              'TYR_PERIOD_3_CREDIT, TYR_PERIOD_3_CLOSE, TYR_PERIOD_4_DEBIT, TYR_PERIOD_4_CREDIT, TYR_PERIOD_4_CLOSE,'+
                              'TYR_PERIOD_5_DEBIT, TYR_PERIOD_5_CREDIT, TYR_PERIOD_5_CLOSE, TYR_PERIOD_6_DEBIT, TYR_PERIOD_6_CREDIT,'+
                              'TYR_PERIOD_6_CLOSE, TYR_PERIOD_7_DEBIT, TYR_PERIOD_7_CREDIT, TYR_PERIOD_7_CLOSE, TYR_PERIOD_8_DEBIT,'+
                              'TYR_PERIOD_8_CREDIT, TYR_PERIOD_8_CLOSE, TYR_PERIOD_9_DEBIT, TYR_PERIOD_9_CREDIT, TYR_PERIOD_9_CLOSE,'+
                              'TYR_PERIOD_10_DEBIT, TYR_PERIOD_10_CREDIT, TYR_PERIOD_10_CLOSE, TYR_PERIOD_11_DEBIT, TYR_PERIOD_11_CREDIT,'+
                              'TYR_PERIOD_11_CLOSE, TYR_PERIOD_12_DEBIT, TYR_PERIOD_12_CREDIT, TYR_PERIOD_12_CLOSE, TYR_OPEN_ORIG, TYR_DEBIT_ORIG,'+
                              'TYR_CREDIT_ORIG, TYR_CLOSE_ORIG, TYR_PERIOD_1_DEBIT_ORIG, TYR_PERIOD_1_CREDIT_ORIG, TYR_PERIOD_1_CLOSE_ORIG,'+
                              'TYR_PERIOD_2_DEBIT_ORIG, TYR_PERIOD_2_CREDIT_ORIG, TYR_PERIOD_2_CLOSE_ORIG, TYR_PERIOD_3_DEBIT_ORIG,'+
                              'TYR_PERIOD_3_CREDIT_ORIG, TYR_PERIOD_3_CLOSE_ORIG, TYR_PERIOD_4_DEBIT_ORIG, TYR_PERIOD_4_CREDIT_ORIG,'+
                              'TYR_PERIOD_4_CLOSE_ORIG, TYR_PERIOD_5_DEBIT_ORIG, TYR_PERIOD_5_CREDIT_ORIG, TYR_PERIOD_5_CLOSE_ORIG,'+
                              'TYR_PERIOD_6_DEBIT_ORIG, TYR_PERIOD_6_CREDIT_ORIG, TYR_PERIOD_6_CLOSE_ORIG, TYR_PERIOD_7_DEBIT_ORIG,'+
                              'TYR_PERIOD_7_CREDIT_ORIG, TYR_PERIOD_7_CLOSE_ORIG, TYR_PERIOD_8_DEBIT_ORIG, TYR_PERIOD_8_CREDIT_ORIG,'+
                              'TYR_PERIOD_8_CLOSE_ORIG, TYR_PERIOD_9_DEBIT_ORIG, TYR_PERIOD_9_CREDIT_ORIG, TYR_PERIOD_9_CLOSE_ORIG,'+
                              'TYR_PERIOD_10_DEBIT_ORIG, TYR_PERIOD_10_CREDIT_ORIG, TYR_PERIOD_10_CLOSE_ORIG, TYR_PERIOD_11_DEBIT_ORIG,'+
                              'TYR_PERIOD_11_CREDIT_ORIG, TYR_PERIOD_11_CLOSE_ORIG, TYR_PERIOD_12_DEBIT_ORIG, TYR_PERIOD_12_CREDIT_ORIG,'+
                              'TYR_PERIOD_12_CLOSE_ORIG) '+
                            'SELECT  FYEAR,'+Dt.FieldByName('rkey').AsString+' AS GL_ACCT_PTR, TYR_OPEN, TYR_DEBIT, TYR_CREDIT, TYR_CLOSE, TYR_PERIOD_1_DEBIT, TYR_PERIOD_1_CREDIT,'+
                              'TYR_PERIOD_1_CLOSE, TYR_PERIOD_2_DEBIT, TYR_PERIOD_2_CREDIT, TYR_PERIOD_2_CLOSE, TYR_PERIOD_3_DEBIT,'+
                              'TYR_PERIOD_3_CREDIT, TYR_PERIOD_3_CLOSE, TYR_PERIOD_4_DEBIT, TYR_PERIOD_4_CREDIT, TYR_PERIOD_4_CLOSE,'+
                              'TYR_PERIOD_5_DEBIT, TYR_PERIOD_5_CREDIT, TYR_PERIOD_5_CLOSE, TYR_PERIOD_6_DEBIT, TYR_PERIOD_6_CREDIT,'+
                              'TYR_PERIOD_6_CLOSE, TYR_PERIOD_7_DEBIT, TYR_PERIOD_7_CREDIT, TYR_PERIOD_7_CLOSE, TYR_PERIOD_8_DEBIT,'+
                              'TYR_PERIOD_8_CREDIT, TYR_PERIOD_8_CLOSE, TYR_PERIOD_9_DEBIT, TYR_PERIOD_9_CREDIT, TYR_PERIOD_9_CLOSE,'+
                              'TYR_PERIOD_10_DEBIT, TYR_PERIOD_10_CREDIT, TYR_PERIOD_10_CLOSE, TYR_PERIOD_11_DEBIT, TYR_PERIOD_11_CREDIT,'+
                              'TYR_PERIOD_11_CLOSE, TYR_PERIOD_12_DEBIT, TYR_PERIOD_12_CREDIT, TYR_PERIOD_12_CLOSE, TYR_OPEN_ORIG, TYR_DEBIT_ORIG,'+
                              'TYR_CREDIT_ORIG, TYR_CLOSE_ORIG, TYR_PERIOD_1_DEBIT_ORIG, TYR_PERIOD_1_CREDIT_ORIG, TYR_PERIOD_1_CLOSE_ORIG,'+
                              'TYR_PERIOD_2_DEBIT_ORIG, TYR_PERIOD_2_CREDIT_ORIG, TYR_PERIOD_2_CLOSE_ORIG, TYR_PERIOD_3_DEBIT_ORIG,'+
                              'TYR_PERIOD_3_CREDIT_ORIG, TYR_PERIOD_3_CLOSE_ORIG, TYR_PERIOD_4_DEBIT_ORIG, TYR_PERIOD_4_CREDIT_ORIG,'+
                              'TYR_PERIOD_4_CLOSE_ORIG, TYR_PERIOD_5_DEBIT_ORIG, TYR_PERIOD_5_CREDIT_ORIG, TYR_PERIOD_5_CLOSE_ORIG,'+
                              'TYR_PERIOD_6_DEBIT_ORIG, TYR_PERIOD_6_CREDIT_ORIG, TYR_PERIOD_6_CLOSE_ORIG, TYR_PERIOD_7_DEBIT_ORIG,'+
                              'TYR_PERIOD_7_CREDIT_ORIG, TYR_PERIOD_7_CLOSE_ORIG, TYR_PERIOD_8_DEBIT_ORIG, TYR_PERIOD_8_CREDIT_ORIG,'+
                              'TYR_PERIOD_8_CLOSE_ORIG, TYR_PERIOD_9_DEBIT_ORIG, TYR_PERIOD_9_CREDIT_ORIG, TYR_PERIOD_9_CLOSE_ORIG,'+
                              'TYR_PERIOD_10_DEBIT_ORIG, TYR_PERIOD_10_CREDIT_ORIG, TYR_PERIOD_10_CLOSE_ORIG, TYR_PERIOD_11_DEBIT_ORIG,'+
                              'TYR_PERIOD_11_CREDIT_ORIG, TYR_PERIOD_11_CLOSE_ORIG, TYR_PERIOD_12_DEBIT_ORIG, TYR_PERIOD_12_CREDIT_ORIG,'+
                              'TYR_PERIOD_12_CLOSE_ORIG '+
                            'FROM Data0110 AS Data0110_1 '+
                            'WHERE (GL_ACCT_PTR ='+inttostr(integer(Fnode.data^))+')';
           DM.Tmp1.ExecSQL;

           DM.Tmp1.Close;
           DM.Tmp1.SQL.text:='update data0106 set gl_acct_no_ptr='+Dt.FieldByName('rkey').AsString +
                             'where gl_acct_no_ptr='+inttostr(integer(Fnode.data^));
           DM.Tmp1.ExecSQL;

           Fis:=false;
          end
         else
          if cdsState=ad then
          begin  //新增，当层未发生业务
           Dt.Post;
//           showmessage(Dt.FieldByName('rkey').AsString);
           DM.Tmp1.Close;
           DM.Tmp1.SQL.text:='INSERT INTO Data0110'+#13+
                            '(FYEAR, GL_ACCT_PTR, TYR_OPEN, TYR_DEBIT, TYR_CREDIT, TYR_CLOSE, TYR_PERIOD_1_DEBIT, TYR_PERIOD_1_CREDIT,'+
                              'TYR_PERIOD_1_CLOSE, TYR_PERIOD_2_DEBIT, TYR_PERIOD_2_CREDIT, TYR_PERIOD_2_CLOSE, TYR_PERIOD_3_DEBIT,'+
                              'TYR_PERIOD_3_CREDIT, TYR_PERIOD_3_CLOSE, TYR_PERIOD_4_DEBIT, TYR_PERIOD_4_CREDIT, TYR_PERIOD_4_CLOSE,'+
                              'TYR_PERIOD_5_DEBIT, TYR_PERIOD_5_CREDIT, TYR_PERIOD_5_CLOSE, TYR_PERIOD_6_DEBIT, TYR_PERIOD_6_CREDIT,'+
                              'TYR_PERIOD_6_CLOSE, TYR_PERIOD_7_DEBIT, TYR_PERIOD_7_CREDIT, TYR_PERIOD_7_CLOSE, TYR_PERIOD_8_DEBIT,'+
                              'TYR_PERIOD_8_CREDIT, TYR_PERIOD_8_CLOSE, TYR_PERIOD_9_DEBIT, TYR_PERIOD_9_CREDIT, TYR_PERIOD_9_CLOSE,'+
                              'TYR_PERIOD_10_DEBIT, TYR_PERIOD_10_CREDIT, TYR_PERIOD_10_CLOSE, TYR_PERIOD_11_DEBIT, TYR_PERIOD_11_CREDIT,'+
                              'TYR_PERIOD_11_CLOSE, TYR_PERIOD_12_DEBIT, TYR_PERIOD_12_CREDIT, TYR_PERIOD_12_CLOSE, TYR_OPEN_ORIG, TYR_DEBIT_ORIG,'+
                              'TYR_CREDIT_ORIG, TYR_CLOSE_ORIG, TYR_PERIOD_1_DEBIT_ORIG, TYR_PERIOD_1_CREDIT_ORIG, TYR_PERIOD_1_CLOSE_ORIG,'+
                              'TYR_PERIOD_2_DEBIT_ORIG, TYR_PERIOD_2_CREDIT_ORIG, TYR_PERIOD_2_CLOSE_ORIG, TYR_PERIOD_3_DEBIT_ORIG,'+
                              'TYR_PERIOD_3_CREDIT_ORIG, TYR_PERIOD_3_CLOSE_ORIG, TYR_PERIOD_4_DEBIT_ORIG, TYR_PERIOD_4_CREDIT_ORIG,'+
                              'TYR_PERIOD_4_CLOSE_ORIG, TYR_PERIOD_5_DEBIT_ORIG, TYR_PERIOD_5_CREDIT_ORIG, TYR_PERIOD_5_CLOSE_ORIG,'+
                              'TYR_PERIOD_6_DEBIT_ORIG, TYR_PERIOD_6_CREDIT_ORIG, TYR_PERIOD_6_CLOSE_ORIG, TYR_PERIOD_7_DEBIT_ORIG,'+
                              'TYR_PERIOD_7_CREDIT_ORIG, TYR_PERIOD_7_CLOSE_ORIG, TYR_PERIOD_8_DEBIT_ORIG, TYR_PERIOD_8_CREDIT_ORIG,'+
                              'TYR_PERIOD_8_CLOSE_ORIG, TYR_PERIOD_9_DEBIT_ORIG, TYR_PERIOD_9_CREDIT_ORIG, TYR_PERIOD_9_CLOSE_ORIG,'+
                              'TYR_PERIOD_10_DEBIT_ORIG, TYR_PERIOD_10_CREDIT_ORIG, TYR_PERIOD_10_CLOSE_ORIG, TYR_PERIOD_11_DEBIT_ORIG,'+
                              'TYR_PERIOD_11_CREDIT_ORIG, TYR_PERIOD_11_CLOSE_ORIG, TYR_PERIOD_12_DEBIT_ORIG, TYR_PERIOD_12_CREDIT_ORIG,'+
                              'TYR_PERIOD_12_CLOSE_ORIG)'+#13+
                            'values('+FYEAR+','+Dt.FieldByName('rkey').AsString+', 0, 0, 0, 0, 0,0,'+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,0,0,'+#13+
                              '0,0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,'+#13+
                              '0,0,0,0,0)';
           DM.Tmp1.ExecSQL;
          end
         else
           Dt.Post;

         if (cdsState=ad) and (Fnode.Level<>0) then       //新加改其父科目
         begin
            DM.Tmp1.Close;
            DM.Tmp1.SQL.Text:='update Data0103 set has_child=1 where rkey='+inttostr(integer(Fnode.Data^));
            DM.Tmp1.ExecSQL;
         end;

         Dt.Connection.CommitTrans;
       except
         on E: Exception do
          begin
           Dt.Connection.RollbackTrans;
           messagedlg(E.Message,mterror,[mbcancel],0);
           exit;
          end;

       end;

       if cdsState=ad then
       begin
         new(iRkey);
         iRkey^:=Dt.fieldbyname('rkey').AsInteger;
         TV.Items.AddChildObject(Fnode,Edit1.Text+trim(edit3.Text)+' '+edit2.Text,iRkey);
       end else
         Fnode.Text:=Edit1.Text+trim(edit3.Text)+' '+edit2.Text;
       cdsState:=bo;
       status1.Caption:='当前状态  ： 浏览';
       Dt.Filtered:= iFiltered;
     end;
  5: begin end;
  7:ToXLS;
  9:close;
  end;
  BtnRts;
end;

procedure TFrm_Main.ToXLS;
var Xls,Sheet,book:Variant;
    I,row,col:integer;
begin
  if application.MessageBox('是否导出资料到EXCEL？','提示', MB_YESNO+MB_ICONQUESTION) <> ID_YES then  exit;
  Try
    Xls:=Createoleobject('Excel.Application');
  Except
    Application.messagebox(PAnsiChar('未安装EXCEL软件,不能导出...'),PAnsiChar('提示'),MB_OK+MB_ICONSTOP);
    Abort;
  End;


  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='SELECT GL_ACC_NUMBER as 科目代码,GL_DESCRIPTION as 科目名称 ,DB_CR as 借贷方向 FROM Data0103 order by GL_ACC_NUMBER';
  DM.Tmp1.Open;

  if F_hint = Nil then Application.CreateForm(Tf_hint,F_hint);
  F_hint.Caption:='数据导出';
  F_hint.Label1.Caption:='会计科目导出，请稍后...' ;
  F_hint.Show;
  F_hint.Animate2.Active:=true;
  F_hint.Update;
  F_hint.ProgressBar1.Max :=DM.Tmp1.RecordCount;

  Xls.Visible:=False;
  Book:=Xls.workbooks.add;
  Sheet:=Book.worksheets[1];
  Sheet.Select;
  Sheet.Cells.VerticalAlignment:=-4108;

  Row:=1;
  Col:=1;

  For I:=0 To DM.Tmp1.FieldCount-1 Do
  begin
    Sheet.cells[Row,Col]:=DM.Tmp1.Fields[i].DisplayLabel;
    inc(col);
  end;

  Row:=2;
 col:=1;
 f_hint.ProgressBar1.Visible := true;
  f_hint.ProgressBar1.Max := DM.Tmp1.RecordCount;
 while  not DM.Tmp1.Eof do
 begin
   For I:=0 To DM.Tmp1.FieldCount-1 Do
   begin
    Sheet.cells[Row,Col]:=DM.Tmp1.Fields[i].Value;
    inc(col);
  end;
  col:=1 ;
  f_hint.ProgressBar1.Stepby(1);
  inc(Row);
  DM.Tmp1.Next;
 end;
 Sheet.cells.Entirecolumn.Autofit;
 F_hint.Hide;
 Xls.Visible:=True;
 DM.Tmp1.Close;
 F_hint.Free;
end;


procedure TFrm_Main.crtTree(Tp: integer);
var node1:TTreeNode;
begin
   if not Dt.Active then
   begin
     Dt.Close;
     Dt.SQL.Text:='SELECT Rkey, isnull(PARENT_PTR,9999) PARENT ,GL_ACC_NUMBER+'' ''+GL_DESCRIPTION nm, TTYPE, GL_ACC_NUMBER, GL_DESCRIPTION, DB_CR, HAS_CHILD, PARENT_PTR, ACTIVE_FLAG, TYR_OPEN, TYR_DEBIT, TYR_CREDIT,'+
                          'TYR_CLOSE, TYR_PROFIT, CURRENT_PERIOD_DEBIT, CURRENT_PERIOD_CREDIT, CURRENT_PERIOD_PROFIT, INCLUDE_QTY, TYR_OPEN_QTY,'+
                          'TYR_DEBIT_QTY, TYR_CREDIT_QTY, TYR_CLOSE_QTY, CURRENT_PERIOD_DEBIT_QTY, CURRENT_PERIOD_CREDIT_QTY, CURR_TP, CURR_PTR,'+
                          'ACC_TP, TYR_OPEN_ORIG, TYR_DEBIT_ORIG, TYR_CREDIT_ORIG, TYR_CLOSE_ORIG, TYR_PROFIT_ORIG, CURRENT_PERIOD_DEBIT_ORIG,'+
                          'CURRENT_PERIOD_CREDIT_ORIG, CURRENT_PERIOD_PROFIT_ORIG, SPEC_RKEY, auto_trans_ptr, multi_column_flag '+
                  'FROM Data0103 where acc_Tp='+inttostr(Tp+1)+' order by GL_ACC_NUMBER';
     Dt.Open;
     node1:=TV.Items.AddChild(nil,'All');
     pAnds(TV,Dt,node1,9999);
   end;

end;

procedure TFrm_Main.init;
var i:integer;
begin
  cdsState:=bo;
  getRtsAll;
  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='select CLASS1,CLASS2,CLASS3,CLASS4,CLASS5,'+
                    'CLASS6,CURR_FYEAR from Data0508';
  DM.Tmp1.Open;


  if not DM.Tmp1.IsEmpty then
  begin
    FL1:=DM.Tmp1.Fields[0].AsInteger;
    FL2:=DM.Tmp1.Fields[1].AsInteger;
    FL3:=DM.Tmp1.Fields[2].AsInteger;
    FL4:=DM.Tmp1.Fields[3].AsInteger;
    FL5:=DM.Tmp1.Fields[4].AsInteger;
    FL6:=DM.Tmp1.Fields[5].AsInteger;
    FYear:=DM.Tmp1.Fields[6].AsString;
  end;

  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='select * from Data0001 where rkey<>1';
  DM.Tmp1.Open;
  setlength(curr_key,DM.Tmp1.RecordCount);
  i:=0;
  while not DM.Tmp1.Eof do
  begin
    ComboBox1.Items.Append(DM.Tmp1.Fields[1].asstring+' '+DM.Tmp1.Fields[2].asstring );
    curr_key[i]:=DM.Tmp1.Fields[0].AsInteger;
    inc(i);
    DM.Tmp1.Next;
  end;

  Dt:=Dm.Data01030;
  TV:=TV0;
  crtTree(0);
  Fnode:=TV.Items[0];
  BtnRts;
end;

procedure TFrm_Main.PageControl1Change(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
   0: begin Dt:=Dm.Data01030;TV:=TV0;end;
   1: begin Dt:=Dm.Data01031;TV:=TV1;end;
   2: begin Dt:=Dm.Data01032;TV:=TV2;end;
   3: begin Dt:=Dm.Data01033;TV:=TV3;end;
   4: begin Dt:=Dm.Data01034;TV:=TV4;end;
   end;
  crtTree(PageControl1.ActivePageIndex);
  if TV.Selected<>nil then  Fnode:=TV.Selected else Fnode:=TV.Items[0];
  TV0Click(TV);
end;

procedure TFrm_Main.TV0Click(Sender: TObject);
var iRkey:integer;
    L:integer;
    s:string;
begin
  if (TTreeView(Sender).Selected=nil) or (TTreeView(Sender).Selected.Parent=nil) then
  begin
     edit1.Text:='';
     edit2.Text:='';
     edit3.Text:='';
     Fnode:=TTreeView(Sender).Items[0];
     BtnRts;
     exit;
  end;
  Fnode:=TTreeView(Sender).Selected;

  case Fnode.Level  of
    0:begin edit1.MaxLength:=FL1; edit3.MaxLength:=0;end;
    1:begin edit1.MaxLength:=FL1; edit3.MaxLength:=0;end;
    2:begin edit1.MaxLength:=0; edit3.MaxLength:=FL2;end;
    3:begin edit1.MaxLength:=0; edit3.MaxLength:=FL3;end;
    4:begin edit1.MaxLength:=0; edit3.MaxLength:=FL4;end;
    5:begin edit1.MaxLength:=0; edit3.MaxLength:=FL5;end;
    6:begin edit1.MaxLength:=0; edit3.MaxLength:=FL6;end;
  end;


  iRkey:=integer(Fnode.Data^);
  if Dt.Locate('Rkey',iRkey,[]) then
  begin
    s:=Dt.fieldbyname('GL_ACC_NUMBER').AsString;
    L:=length(s);

    if Fnode.Level=1 then
    begin
      edit1.Text:=s;
      edit3.Text:='';
    end else if Fnode.Level=2 then
    begin
      edit1.Text:=copy(s,1,FL1);
      edit3.Text:=copy(s,1+FL1,FL2);
    end else if Fnode.Level=3 then
    begin
      edit1.Text:=copy(s,1,FL1+FL2);
      edit3.Text:=copy(s,1+FL1+FL2,FL3);
    end else if Fnode.Level=4 then
    begin
      edit1.Text:=copy(s,1,FL1+FL2+FL3);
      edit3.Text:=copy(s,1+FL1+FL2+FL3,FL4);
    end else if Fnode.Level=5 then
    begin
      edit1.Text:=copy(s,1,FL1+FL2+FL3+FL4);
      edit3.Text:=copy(s,1+FL1+FL2+FL3+FL4,FL5);
    end else
    begin
      edit1.Text:=copy(s,1,FL1+FL2+FL3+FL4+FL5);
      edit3.Text:=copy(s,1+FL1+FL2+FL3+FL4+FL5,FL6);
    end;
   { if L=FL1 then
    begin
      edit1.Text:=s;
      edit3.Text:='';
    end else if L=FL1+FL2 then
    begin
      edit1.Text:=copy(s,1,FL1);
      edit3.Text:=copy(s,1+FL1,FL2);
    end else if L=FL1+FL2+FL3 then
    begin
      edit1.Text:=copy(s,1,FL1+FL2);
      edit3.Text:=copy(s,1+FL1+FL2,FL3);
    end else if L=FL1+FL2+FL3+FL4 then
    begin
      edit1.Text:=copy(s,1,FL1+FL2+FL3);
      edit3.Text:=copy(s,1+FL1+FL2+FL3,FL4);
    end else if L=FL1+FL2+FL3+FL4+FL5 then
    begin
      edit1.Text:=copy(s,1,FL1+FL2+FL3+FL4);
      edit3.Text:=copy(s,1+FL1+FL2+FL3+FL4,FL5);
    end else
    begin
      edit1.Text:=copy(s,1,FL1+FL2+FL3+FL4+FL5);
      edit3.Text:=copy(s,1+FL1+FL2+FL3+FL4+FL5,FL6);
    end;
    }
    edit2.Text:=Dt.fieldbyname('GL_DESCRIPTION').AsString;

    CBValid.Checked:=Dt.FieldByName('Active_flag').AsString='Y'; //有效科目

    if  Dt.FieldByName('CURR_TP').AsInteger=0 then
    begin
      RadioButton1.Checked:=true;
      ComboBox1.ItemIndex:=-1;
    end else begin  //币种核算
      RadioButton3.Checked:=true;
      DM.Tmp1.Close ;
      DM.Tmp1.SQL.text:='select * from data0001 where rkey='+Dt.fieldbyname('CURR_PTR').AsString ; //外币rkey
      DM.Tmp1.Open ;
      ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(DM.Tmp1.Fields[1].asstring+' '+DM.Tmp1.Fields[2].asstring);
    end;

    CheckBox1.Checked:=Dt.FieldByName('INCLUDE_QTY').Value='Y'; //辅助核算

    CheckBox2.Checked:=Dt.FieldByName('multi_column_flag').AsBoolean; //是否多栏式科目

    if Dt.FieldByName('db_cr').Value='D' then  //借贷方向
      radiogroup1.itemindex:=0
    else
      radiogroup1.itemindex:=1;
    if Dt.FieldByName('auto_trans_ptr').AsString<>'' then  //自动结转
    begin
       DM.Tmp1.Close;
       DM.Tmp1.SQL.text:='SELECT rkey, GL_DESCRIPTION,GL_ACC_NUMBER  FROM Data0103 where rkey='+Dt.FieldByName('auto_trans_ptr').AsString;
       DM.Tmp1.Open;
       Edit5.Text:=DM.Tmp1.Fields[2].AsString;
       Edit4.Text:=DM.Tmp1.Fields[1].AsString;
    end else begin
      Edit5.Text:='';
      Edit4.Text:='';
    end;

  end else begin
    edit1.Text:='';
    edit2.Text:='';
  end;
  BtnRts;
end;

procedure TFrm_Main.TV0GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then Node.ImageIndex:=23 else Node.ImageIndex:=22
end;

procedure TFrm_Main.TV0GetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
   node.SelectedIndex:=0;
end;

procedure TFrm_Main.EdtEn;
var sGL_ACC_NUMBER:string;
    L,L1:integer;
begin
  edit3.Visible:=((FNode<>nil) and (FNode.Parent<>nil) and (FNode.Parent.Parent<>nil)) or
                  ((cdsState=ad) and (Fnode.Level<>0));
  Shape1.Visible:=edit3.Visible;

  Edit1.Enabled:=(not Shape1.Visible) and (cdsState<>bo) and (not Fnode.HasChildren or (Fnode.Level=0));

  Edit2.Enabled:=cdsState<>bo;
  Edit3.Enabled:=cdsState<>bo;
  GroupBox1.Enabled:=(cdsState<>bo) and  (PageControl1.ActivePageIndex<3); //成本sunyi不核算外币

  RadioGroup1.Enabled:=(PageControl1.ActivePageIndex in [0,4]) and
                  (((cdsstate=ad) and (Fnode.Level=0)) or ((cdsstate=ed) and not Fnode.HasChildren) and (Fnode.Level=1));



  GroupBox3.Enabled:=(cdsState<>bo) and (PageControl1.ActivePageIndex=3); //成本才可结转
  CheckBox1.Enabled:=cdsState<>bo;
  CheckBox2.Enabled:=cdsState<>bo;
  CBValid.Enabled:= (cdsState=ed) and not Fnode.HasChildren;

  if (cdsState<>bo) and (PageControl1.ActivePageIndex>2)  then
  begin
    GroupBox1.Enabled:=false;
    RadioButton1.Checked:=true;
  end;

  if cdsState=ad then
  begin

    CBValid.Checked:=true;
    edit2.Text:='';
    if Fnode.Level=0 then
    begin
      DM.Tmp1.Close;
      DM.Tmp1.SQL.Text:='SELECT top 1 GL_ACC_NUMBER '+
                        'FROM Data0103 where acc_Tp='+inttostr(PageControl1.ActivePageIndex+1)+' and len(GL_ACC_NUMBER)='+inttostr(FL1)+' order by GL_ACC_NUMBER desc';

      DM.Tmp1.Open;
      if DM.Tmp1.IsEmpty then edit1.Text:='' else edit1.Text:=inttostr(DM.Tmp1.Fields[0].AsInteger+1);
    end else begin

      if vld and not fnode.HasChildren then
      begin
        if (messagedlg('该科目已经发生业务,所有科目将会被转'+#13+'记到下级子科目，是否继续？',mtinformation,[mbYes,mbNo],0)=mrNo) then
        begin
          Fis:=False;
          BtAddClick(BtCancel);
          abort;
        end
        else
          Fis:=true; //新增下层，若当层已发生业务，
      end else Fis:=false;


       sGL_ACC_NUMBER:=copy(Fnode.Text,1,pos(' ',Fnode.Text)-1);
       edit1.Text:=sGL_ACC_NUMBER;
       case  Fnode.Level of
        1:begin L:=FL1+FL2; L1:=FL2;end;
        2:begin L:=FL1+FL2+FL3;L1:=FL3;end;
        3:begin L:=FL1+FL2+FL3+FL4; L1:=FL4;end;
        4:begin L:=FL1+FL2+FL3+FL4+FL5; L1:=FL5;end;
        5:begin L:=FL1+FL2+FL3+FL4+FL5+FL6;L1:=FL6;end;
       end;

       DM.Tmp1.Close;
       DM.Tmp1.SQL.Text:='SELECT top 1 GL_ACC_NUMBER '+
                         'FROM Data0103 where acc_Tp='+inttostr(PageControl1.ActivePageIndex+1)+' and GL_ACC_NUMBER like '''+sGL_ACC_NUMBER+'%'''+
                         ' and len(GL_ACC_NUMBER)='+inttostr(L)+'  order by GL_ACC_NUMBER desc';

       DM.Tmp1.Open;
       if DM.Tmp1.IsEmpty then edit3.Text:=rightstr('000001',L1) else
       begin
          if Fnode.Level=1 then edit3.Text:=rightstr('000000'+inttostr(strtoint(rightstr(DM.Tmp1.Fields[0].asstring,FL2))+1),FL2) else
          if Fnode.Level=2 then edit3.Text:=rightstr('000000'+inttostr(strtoint(rightstr(DM.Tmp1.Fields[0].asstring,FL2))+1),FL3) else
          if Fnode.Level=3 then edit3.Text:=rightstr('000000'+inttostr(strtoint(rightstr(DM.Tmp1.Fields[0].asstring,FL2))+1),FL4) else
          if Fnode.Level=4 then edit3.Text:=rightstr('000000'+inttostr(strtoint(rightstr(DM.Tmp1.Fields[0].asstring,FL2))+1),FL5) else
          if Fnode.Level=5 then edit3.Text:=rightstr('000000'+inttostr(strtoint(rightstr(DM.Tmp1.Fields[0].asstring,FL2))+1),FL6) ;

       end;
     end;
  end;
end;

procedure TFrm_Main.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0','1','2','3','4','5','6','7','8','9',#8]) then begin key:=#0;abort;end;
end;

procedure TFrm_Main.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0','1','2','3','4','5','6','7','8','9',#8]) then begin key:=#0;abort;end;
end;

procedure TFrm_Main.savValue;
begin
  if cdsState=ad then  Dt.Append else Dt.Edit;
  Dt.fieldbyname('GL_ACC_NUMBER').AsString:=Edit1.Text+trim(edit3.Text);
  Dt.fieldbyname('GL_DESCRIPTION').AsString:=trim(edit2.Text);

    if RadioButton1.Checked then  //币种核算
    begin
      Dt.FieldByName('CURR_TP').Value:=0;
      Dt.FieldByName('CURR_PTR').Value:=null ;
    end else begin
      Dt.FieldByName('CURR_TP').Value:=2;
      Dt.FieldByName('CURR_PTR').Value:=curr_key[ComboBox1.ItemIndex];
    end;
    if CheckBox1.Checked  then    //辅助核算
      Dt.FieldByName('INCLUDE_QTY').Value:='Y'
    else
      Dt.FieldByName('INCLUDE_QTY').Value:='N';
    Dt.FieldByName('multi_column_flag').AsBoolean  :=CheckBox2.Checked; //是否多栏式科目

    if radiogroup1.itemindex=0 then      //借贷方向
      Dt.FieldByName('db_cr').Value:='D'
    else
      Dt.FieldByName('db_cr').Value:='C';

    if cdsstate=ad then Dt.FieldByName('ACC_TP').Value:=PageControl1.ActivePageIndex+1; //科目类型

    if iAuto_trans_ptr>0 then begin
       Dt.FieldByName('auto_trans_ptr').Value:=iAuto_trans_ptr;       //自动结转
       iAuto_trans_ptr:=-1;
    end else
       Dt.FieldByName('auto_trans_ptr').Value:=null;

    if cdsstate=ad then Dt.FieldByName('Ttype').Value:=fnode.Level;  //科目级别

    if (cdsstate=ad) and (Fnode.Level>0) then Dt.FieldByName('PARENT_PTR').Value:=integer(Fnode.data^);
    if cdsstate=ad then Dt.FieldByName('has_child').Value:=0;     //新增都为明细
    if CBValid.Checked then Dt.FieldByName('Active_flag').Value:='Y' else Dt.FieldByName('Active_flag').Value:='N';
end;

procedure TFrm_Main.svValid;
begin
  if (Fnode.Level=0) and (copy(edit1.Text,1,1)='0') then
  begin
    showmessage('一级科目首位代码不能为0');
    abort;
  end;
  if ((cdsstate=ad) and
     (((Fnode.Level=0) and (length(edit1.Text)<>FL1)) or  ((Fnode.Level=1) and (length(edit3.Text)<>FL2)) or
     ((Fnode.Level=2) and (length(edit3.Text)<>FL3)) or  ((Fnode.Level=3) and (length(edit3.Text)<>FL4)) or
     ((Fnode.Level=4) and (length(edit3.Text)<>FL5)) or  ((Fnode.Level=5) and (length(edit3.Text)<>FL6))))  or
     ((cdsstate=ed) and
     (((Fnode.Level=1) and (length(edit1.Text)<>FL1)) or ((Fnode.Level=6) and (length(edit3.Text)<>FL6)) or
     ((Fnode.Level=2) and (length(edit3.Text)<>FL2)) or  ((Fnode.Level=3) and (length(edit3.Text)<>FL3)) or
     ((Fnode.Level=4) and (length(edit3.Text)<>FL4)) or  ((Fnode.Level=5) and (length(edit3.Text)<>FL5)))) then
  begin
    showmessage('科目代码长度不对');
    abort;
  end;

  if trim(Edit2.Text)='' then
  begin
    showmessage('科目名称不能为空');
    abort;
  end;
  if RadioButton3.Checked and (ComboBox1.ItemIndex=-1) then
  begin
    showmessage('核算外币必须指定');
    abort;
  end;

  if edit1.Text+edit3.Text<>Dt.FieldByName('GL_ACC_NUMBER').AsString then
  begin
    DM.Tmp1.Close;
    DM.Tmp1.SQL.Text:='select rkey from Data0103 where GL_ACC_NUMBER='''+edit1.Text+edit3.Text+'''';
    DM.Tmp1.Open;
    if ((cdsstate=ad) and (DM.Tmp1.RecordCount=1)) or ((cdsstate=ed) and (DM.Tmp1.RecordCount>0))  then
    begin
      showmessage('此科目代码已重复，请重新输入');
      abort;
    end;
  end;
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var sID,sNm:string ;
begin
  iAuto_trans_ptr:=Frm_tree_u.TFrm_tree.getStr(Dt,true,sID,sNm,'转入类科目');
  Edit5.Text:=sID;
  Edit4.Text:=sNm;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
begin
  Edit5.Text:='';
  Edit4.Text:='';
  iAuto_trans_ptr:=-1;
end;

procedure TFrm_Main.BtQryClick(Sender: TObject);
var
    i:integer;
begin
  if edit6.Text='' then exit;
  if not Dt.Locate('GL_ACC_NUMBER',trim(edit6.Text),[loPartialKey]) then
    if not Dt.Locate('GL_DESCRIPTION',trim(edit6.Text),[loPartialKey]) then
  begin
    showmessage('科目不存在');
    exit;
  end;
  for i:=1 to TV.Items.Count-1 do
  begin
    if integer(TV.Items[i].data^)=Dt.fieldbyname('rkey').asinteger then
    begin
      Fnode:=TV.Items[i];
      TV.Selected:=Fnode;
      TV0Click(TV);
      break;
    end;
  end;
end;

procedure TFrm_Main.TV0Change(Sender: TObject; Node: TTreeNode);
begin
TV0Click(Sender);
end;

function TFrm_Main.vld: boolean;
begin
  result:=false;
  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='select top 1 * from data0106 where gl_acct_no_ptr='+inttostr(integer(Fnode.Data^));
  DM.Tmp1.Open;
  result:=not DM.Tmp1.IsEmpty;
  DM.Tmp1.Close;
end;

end.
