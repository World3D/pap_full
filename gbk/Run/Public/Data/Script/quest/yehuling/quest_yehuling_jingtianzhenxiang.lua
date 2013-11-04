--��������

--MisDescBegin
x207007_g_ScriptId = 207007
x207007_g_MissionIdPre =7
x207007_g_MissionId = 8
x207007_g_MissionKind = 1
x207007_g_ScriptIdNext = {ScriptId = 207008 ,LV = 1 }
x207007_g_Name	="��������" 
x207007_g_Name2	="���������" 

x207007_g_MissionName="��������"
x207007_g_MissionInfo="    �����ˣ�������������������飬˵������Ҳ�����������塣#G����Ӫ#Wһս����һ����������ʯ�����ٲ�����ӳǳ���һ����ɱ�ɾ�����#G����#W��ֻ�ǣ���һ��û����#G����#W����Ϊһ����#Gˮ��#W��Ů�ˣ����������嵲ס����������һ������������ʱ�򣬽����ı���#G����#W�����¶�����Ҹ���Ц����\n \n��һ�̣�ʮ������ڽ�ս���˶���Ĭ�ˣ����ǵ�Ŀ�ⶼ����������ܷ�ݵ�ʬ���ϣ�����ĺ�ɱ����üž��ˡ�\n \n#G����#W����ˣ�����������ҹ���ǣ�������ǣ���֮�����ܻ�����������Ϊ�ҷ������ǰٲ���������������ɹ��ˡ��������壬����#G����#W��#Gˮ��#W�Ķ���֮�������������ô���ֵģ���Ҳ����������������ʵ��Ҫ�������ֻ��һ���취���ҵ��Ǹ��ٲ�����������ˣ��������ױ��ϣ���Ϊ���Ĺ����ر���ҪС���ˡ�"  --��������
x207007_g_MissionTarget="    Ѱ����ɱ#Gˮ��#W��������"		
x207007_g_MissionComplete="    ʮ��������ãã����˼��������������Щ�������ˣ�ȴ���ţ���Щ�˻��š�����֪���������Ѿ����ˣ�"					--�������npc˵���Ļ�
--������
x207007_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x207007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207007_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207007_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207007_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207007_g_MissionName)
			AddText(sceneId,x207007_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207007_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207007_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207007_g_ScriptId, x207007_g_MissionId)
		end
        elseif x207007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207007_g_MissionName)
                AddText(sceneId,x207007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207007_g_ScriptId, x207007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207007_g_ScriptId, x207007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207007_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207007_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207007_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207007_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207007_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207007_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
     
end

--**********************************

--����

--**********************************

function x207007_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207007_g_MissionId, x207007_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207007_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207007_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207007_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207007_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207007_g_MissionId)
		AddExp(sceneId, selfId, x207007_g_ExpBonus)
		AddMoney(sceneId, selfId, x207007_g_MoneyBonus)
		for i, item in x207007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x207007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207007_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207007_OnItemChanged(sceneId, selfId, itemdataId)

end

