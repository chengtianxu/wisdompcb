unit price_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ADODB,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, Buttons, RzTabs, DBGridEh, Menus, IdFTP;

type
  TfrmEdit = class(TForm)
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBText2: TDBText;
    DBEdit3: TDBEdit;
    DBText3: TDBText;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBText4: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    dbedtuser_full_name: TDBEdit;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    pg1: TRzPageControl;
    rztbshtTabSheet1: TRzTabSheet;
    StringGrid1: TStringGrid;
    rztbshtTabSheet2: TRzTabSheet;
    dbFile: TDBGridEh;
    pmFile: TPopupMenu;
    NDown: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure pg1Changing(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure NDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation

uses
  damo,common,ShellAPI;

{$R *.dfm}

procedure TfrmEdit.FormActivate(Sender: TObject);
var
 i:byte;
begin
  if DM.aqmainAVL_FLAG.Text='已认可' then
  combobox1.ItemIndex:=0
  else
  if DM.aqmainAVL_FLAG.Value='未认可' then
  combobox1.ItemIndex:=1
  else
  ComboBox1.ItemIndex:=2;
  combobox2.ItemIndex:=DM.aq1AMT_QUAN_FLAG.Value-1;
  if DM.aq1AMT_QUAN_FLAG.Value=1 then
  dbedit13.DataField := 'MIN_ORDER_QTY'
  else
  dbedit13.DataField := 'MIN_ORDER_amt';
  stringgrid1.Cells[0,0] := '从';
  stringgrid1.Cells[1,0] := '至';
  stringgrid1.Cells[2,0] := '供应商价格';
  stringgrid1.Cells[3,0] := '折扣%';
  stringgrid1.Cells[0,1] := '0';
  stringgrid1.Cells[2,1] := '0.000';
  stringgrid1.Cells[3,1] := '0.000';
  for i:=1 to 5 do
  if DM.aqmain.FieldValues['quan_vol_'+inttostr(i)]>0 then
  begin
    stringgrid1.Cells[1,i]:=formatfloat('0',DM.aqmain.FieldValues['quan_vol_'+inttostr(i)]);
    stringgrid1.Cells[2,i+1]:='0.000';
    stringgrid1.Cells[3,i+1]:='0.000';
    stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
    if i=5 then          //处理价格范围
    stringgrid1.Cells[1,6]:='无限制';
  end
  else
  begin
    stringgrid1.Cells[1,i] := '无限制';
    stringgrid1.Cells[2,i] := '0.000';
    stringgrid1.Cells[3,i] := '0.000';
    break;
  end;
  for i:=1 to 6 do                  //处理价格
  if DM.aqmain.FieldValues['price_'+inttostr(i)]>0 then
  stringgrid1.Cells[2,i]:=formatfloat('0.000',DM.aqmain.FieldValues['price_'+inttostr(i)])
  else
  break;
  for i:=1 to 6 do                   //处理折扣
  if DM.aqmain.FieldValues['disc_'+inttostr(i)]>0 then
  stringgrid1.Cells[3,i]:=formatfloat('0.000',DM.aqmain.FieldValues['disc_'+inttostr(i)])
  else
  break;
end;

procedure TfrmEdit.pg1Changing(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if (vprev = '2') or (vprev = '4') then  Exit;
  if NewIndex = 0 then AllowChange:= False;
end;

procedure TfrmEdit.NDownClick(Sender: TObject);
var
  LTmp:TADOQuery;
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
begin
  if dm.qryFile.IsEmpty then Exit;
  LSaveDlg:= TSaveDialog.Create(nil);
  LTmp:= TADOQuery.Create(nil);
  LTmp.Connection:= dm.con1;
  LFtp:= TIdFTP.Create(nil);
  try
      with DM.aq3 do
      begin
        Close;
        SQL.Text:= 'SELECT FileName,Ftp_FileName FROM Tier3_CustomerFiles WHERE IDKey = ' + QuotedStr(DM.qryFileFtpIDKey.AsString);
        Open;
        if not IsEmpty then
        begin
          LFileName:= Fields[0].AsString;
          LFtpName:= Fields[1].AsString;
          LSaveDlg.FileName:= LFileName;
          if LSaveDlg.Execute then
          begin
            with LTmp do
            begin
              Close;
              SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                         ' from tier3_ftplist where rkey = ' + DM.qryFileFtp_Ptr.AsString;
              open;
              if not IsEmpty then
              begin
                LFtp.Host := Fields[1].AsString;
                LFtp.Username := Fields[2].AsString;
                LFtp.Password := Fields[3].AsString;
                LFtpDir := Trim(Fields[4].AsString);
              end;
            end;
            try
              if not LFtp.Connected then LFtp.Connect(True,10000);
              if LFTp.Connected then
              begin
//                LFTp.TransferType:= ftBinary;
                LFTp.Get(LFtpDir+LFtpName,LSaveDlg.FileName,True);
                ShellExecute(0,'open',pchar(LSaveDlg.FileName),nil,nil,SW_SHOWNORMAL);
              end;
            except
              ShowMessage('FTP链接失败,下载失败');
              Exit;
            end;
          end;
        end
        else
        begin
          ShowMessage('此文件还没有上传到FTP，请先保存后再下载！');
          exit;
        end;
      end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LTmp.Free;
    LFTp.Free;
  end;
end;

end.
