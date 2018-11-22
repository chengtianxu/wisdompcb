unit DEPT_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TForm3 = class(TForm)
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    BitBtn3: TBitBtn;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label19: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);

  private
     v_close:byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses uNew,uDM;

{$R *.dfm}

procedure TForm3.Button2Click(Sender: TObject);
begin
    Close;
    v_close:=1;
    dm.ADOTable1.Cancel;
    FormNew.Show;

end;

procedure TForm3.Button1Click(Sender: TObject);
var
   flag:Integer;
begin
  if DbEdit1.Text='' then
  begin
    MessageDlg('请选择工序代码',mtinformation,[mbOk],0);
    DbEdit1.SetFocus;
    exit;
  end;
  if DbMemo1.Text='' then
  begin
    MessageDlg('请输入内容',mtinformation,[mbok],0);
    DbMemo1.SetFocus;
    exit;
  end;

  end;

  try
    if form1.ADOTable1.Modified then
    begin
         form1.ADOTable1.Post;
    end;
  except
    MessageDlg('保存失败，请检查代码是否重复',mtwarning,[mbok],0);
    exit;
    end;
   close;
   v_close:=1;
   form1.Show;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if v_close<>1 then
  begin
    Form1.ADOTable1.Cancel;
    Form1.Show;
  end;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields :='DEPT_CODE/工序代码/110,DEPT_NAME/工序名称/251,'+
                        'STEP_NUMBER/步骤/80';

      InputVar.Sqlstr :='SELECT TOP 100 PERCENT Data0034.DEPT_CODE, Data0034.DEPT_NAME,'+#13+
      'Data0038.STEP_NUMBER, Data0034.RKEY'+#13+
      'FROM         dbo.Data0038 INNER JOIN'+#13+
      ' dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
      'WHERE  (dbo.Data0034.IS_COST_DEPT = 1) and'+#13+
      '(dbo.Data0038.SOURCE_PTR ='+rkey25.caption+')'+#13+
      'ORDER BY dbo.Data0038.STEP_NUMBER';
     end;
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;

    if frmPick_Item_Single.ShowModal=mrok then
    begin
    Edit5.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
    end;


   finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
  end;

end.
