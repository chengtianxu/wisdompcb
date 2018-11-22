unit DEPT_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons,ConstVar;

type
  TForm3 = class(TForm)
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
     v_close:byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses uNew,uDM, Pick_Item_Single, DEPT_Main,uMain, DEPT_Add;

{$R *.dfm}

procedure TForm3.Button2Click(Sender: TObject);
begin
    Close;
    v_close:=1;
    dm.ADOTable1.Cancel;
    //FormNew.Show;

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
  {if DbMemo1.Text='' then
  begin
    MessageDlg('请输入内容',mtinformation,[mbok],0);
    DbMemo1.SetFocus;
    exit;
  end; }

  

  

  try
    if dm.ADOTable1.Modified then
    begin
         dm.ADOTable1.Post;
    end;
  except
    MessageDlg('保存失败，请检查代码是否重复',mtwarning,[mbok],0);
    exit;
    end;
   close;
   v_close:=1;
   modalresult:=mrok;
  dm.ADOTable1.Close;
  dm.ADOTable1.Open;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {if v_close<>1 then
  begin
    Form1.ADOTable1.Cancel;
    Form1.Show;
  end;   }close;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
  rkey25:Integer;
  InputVar: PDlgInput ;
begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
   if vtype=0 then
   begin
   rkey25:=StrToInt(FormNew.label25.Caption);
   end
   else
   begin
   rkey25:=dm.ADO0738RKEY25.value;
   end;

   with dm.ADOQuery1 do
   begin
   close;
   sql.Clear;
   SQL.Text:='select RKEY as rkey25,MANU_PART_NUMBER,MANU_PART_DESC from data0025 where RKEY='+quotedstr(IntToStr(rkey25));
   open;
   end;

    InputVar.Fields :='DEPT_CODE/工序代码/110,DEPT_NAME/工序名称/251,'+
                        'STEP_NUMBER/步骤/80';

      InputVar.Sqlstr :='SELECT TOP 100 PERCENT Data0034.DEPT_CODE, Data0034.DEPT_NAME,'+#13+
      'Data0038.STEP_NUMBER, Data0034.RKEY'+#13+
      'FROM         dbo.Data0038 INNER JOIN'+#13+
      ' dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY  INNER JOIN'+#13+
      ' dbo.data0025 on dbo.Data0038.SOURCE_PTR=dbo.data0025.rkey'+#13+
      'WHERE (dbo.data0025.rkey ='+dm.ADOQuery1.fieldbyname('rkey25').AsString+')'+#13+
      'ORDER BY dbo.Data0038.STEP_NUMBER';

    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;

    if frmPick_Item_Single.ShowModal=mrok then
    begin
    DBEdit1.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];


    if vtype=0 then
    begin
    with dm.ADOTMP2 do
    begin
    close;
    sql.Clear;
    SQL.Text:='select top 1 Rkey=Rkey+1  from FA0738 order by Rkey desc';
    open;
    end;

    if not dm.ADOTMP2.IsEmpty then
    begin
    with dm.ADOTMP3 do
    begin
    Close;
    SQL.Clear;
    SQL.Text:='select 1 from fa0739 where d738_ptr='+inttostr(dm.ADOTMP2.fieldbyname('Rkey').value)+
             ' and DEPT_CODE='+quotedstr(DBEdit1.Text);
    Open;
    end;
    end
    else
    begin
      with dm.ADOTMP3 do
    begin
    Close;
    SQL.Clear;
    SQL.Text:='select 1 from fa0739 where d738_ptr=1'+
             ' and DEPT_CODE='+quotedstr(DBEdit1.Text);
    Open;
    end;
    end;



    if not dm.ADOTMP3.IsEmpty then
    begin
    ShowMessage('工序代码有重复,请检查！！');
    Exit;
    end;

    end
    else
    begin
    with dm.ADOTMP3 do
    begin
    Close;
    SQL.Clear;
    SQL.Text:='select 1 from fa0739 where d738_ptr='+inttostr(dm.ADO0738.fieldbyname('Rkey').value)+
             ' and DEPT_CODE='+quotedstr(DBEdit1.Text);
    Open;
    end;

    if not dm.ADOTMP3.IsEmpty then
    begin
    ShowMessage('工序代码有重复,请检查！！');
    Exit;
    end;
    end;
    end;


   finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
  end;
  end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Close;
v_close:=1;
dm.ADOTable1.Cancel;
end;

end.
